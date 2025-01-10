## ```
##     _         _
##    / \   _ __| |_   _ __ ___   ___
##   / _ \ | '__| __| | '__/ _ \ / __|
##  / ___ \| |  | |_ _| | | (_) | (__
## /_/   \_\_|   \__(_)_|  \___/ \___|
## ```
## Provides functions for converting strings to ASCII art.
module [str_to_art, str_to_art_lines, str_to_art_trimmed, letters_to_art, letters_to_art_lines, str_to_letters]

import Letters exposing [AsciiLetter, empty_letter, char_to_ascii_letter]

## Converts a string to an ASCII art representation. The art is a single string with newline chars.
str_to_art : Str -> Str
str_to_art = \str ->
    str_to_letters(str)
    |> letters_to_art

## Converts a string to a ASCII art as a list of the horizontal lines which compose the art. New line chars are not included.
str_to_art_lines : Str -> List Str
str_to_art_lines = \str -> str |> str_to_letters |> letters_to_art_lines

## Converts a string to an ASCII art representation. Same as strToArt, but removes the top and bottomw lines if they are empty.
str_to_art_trimmed : Str -> Str
str_to_art_trimmed = \str ->
    str
    |> str_to_art_lines
    |> List.walk([], \lines, l -> if List.is_empty(lines) && Str.trim(l) |> Str.is_empty then [] else List.append(lines, l))
    |> List.reverse
    |> List.walk([], \lines, l -> if List.is_empty(lines) && Str.trim(l) |> Str.is_empty then [] else List.append(lines, l))
    |> List.reverse
    |> Str.join_with("\n")

## Converts a string to a list of AsciiLetter objects.
str_to_letters : Str -> List AsciiLetter
str_to_letters = \str ->
    Str.to_utf8(str) |> List.map(\char -> char_to_ascii_letter(char))

## Converts a list of AsciiLetter objects to ASCII art as a list strings for each horizontal line of the art.
letters_to_art_lines : List AsciiLetter -> List Str
letters_to_art_lines = \letters ->
    letters_joined = List.walk(
        letters,
        empty_letter,
        \acc, letter ->
            overlap =
                List.min([get_overlap(acc, letter), acc.max_tail_overlap, letter.max_head_overlap])
                |> Result.with_default(0)
            when (acc.rows, letter.rows) is
                ([row0, row1, row2, row3, row4, row5], [let0, let1, let2, let3, let4, let5]) ->
                    {
                        rows: [
                            join_letter_rows(row0, let0, overlap),
                            join_letter_rows(row1, let1, overlap),
                            join_letter_rows(row2, let2, overlap),
                            join_letter_rows(row3, let3, overlap),
                            join_letter_rows(row4, let4, overlap),
                            join_letter_rows(row5, let5, overlap),
                        ],
                        max_head_overlap: acc.max_head_overlap,
                        max_tail_overlap: letter.max_tail_overlap,
                    }

                _ -> acc,
    )
    letters_joined.rows
    |> List.map(
        \row ->
            row
            |> Str.from_utf8
            |> Result.with_default(""),
    )

## Converts a list of AsciiLetter objects to ASCII art as a single string with newline chars dividing horizontal lines.
letters_to_art : List AsciiLetter -> Str
letters_to_art = \letters -> letters_to_art_lines(letters) |> Str.join_with("\n")

## Join the rows of two letters together with the specified overlap.
join_letter_rows : List U8, List U8, U8 -> List U8
join_letter_rows = \row1, row2, overlap ->
    when (row1, row2) is
        ([], []) -> []
        (_, []) -> row1
        ([], _) -> row2
        ([.. as xs, x], [y, .. as ys]) ->
            if overlap > 1 then
                if y == ' ' then
                    join_letter_rows(row1, ys, (overlap - 1))
                else
                    join_letter_rows(xs, row2, (overlap - 1))
            else if overlap == 1 then
                keep =
                    if x == ')' && y == '(' then
                        '|'
                    else if character_priority(x) > character_priority(y) then
                        x
                    else
                        y
                List.join([xs, [keep], ys])
            else
                List.concat(row1, row2)

## Calculate the overlap between to AsciiLetters.
get_overlap : AsciiLetter, AsciiLetter -> U8
get_overlap = \letter1, letter2 ->
    edges1 =
        letter1.rows
        |> List.map(
            \row ->
                List.reverse(row)
                |> List.walk_until(
                    (0, ' '),
                    \(edge_pos, _), char ->
                        if char == ' ' then Continue((edge_pos + 1, char)) else Break((edge_pos, char)),
                ),
        )
    edges2 =
        letter2.rows
        |> List.map(
            \row ->
                List.walk_until(
                    row,
                    (0, ' '),
                    \(edge_pos, _), char ->
                        if char == ' ' then Continue((edge_pos + 1, char)) else Break((edge_pos, char)),
                ),
        )
    List.map2(
        edges1,
        edges2,
        \(pos1, ch1), (pos2, ch2) ->
            if
                (ch1 == 'V' || ch2 == 'V')
                || (ch1 == '\\' && ch2 == '/')
                || (ch1 == '/' && ch2 == '\\')
                || (ch1 == '<' && (ch2 == '/' || ch2 == '\\'))
                || (ch2 == '>' && (ch1 == '/' || ch1 == '\\'))
            then
                pos1 + pos2
            else
                pos1 + pos2 + 1,
    )
    |> List.min
    |> Result.with_default(0)

expect
    overlap = get_overlap(char_to_ascii_letter('a'), char_to_ascii_letter('a'))
    overlap == 1
expect
    overlap = get_overlap(char_to_ascii_letter('a'), char_to_ascii_letter('A'))
    overlap == 1
expect
    overlap = get_overlap(char_to_ascii_letter('A'), char_to_ascii_letter('A'))
    overlap == 0
expect
    overlap = get_overlap(char_to_ascii_letter('A'), char_to_ascii_letter('a'))
    overlap == 2
expect
    overlap = get_overlap(char_to_ascii_letter('V'), char_to_ascii_letter('a'))
    overlap == 3
expect
    overlap = get_overlap(char_to_ascii_letter('A'), char_to_ascii_letter('V'))
    overlap == 4
expect
    overlap = get_overlap(char_to_ascii_letter('V'), char_to_ascii_letter('A'))
    overlap == 4

## Returns the priority of a character for the purpose of determining overlap.
character_priority : U8 -> U8
character_priority = \c ->
    when c is
        '<' -> 5
        '>' -> 5
        '(' -> 4
        ')' -> 4
        '\\' -> 3
        '/' -> 3
        '|' -> 2
        ' ' -> 0
        _ -> 1
