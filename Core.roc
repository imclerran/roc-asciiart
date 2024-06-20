module [lettersToStr, strToAsciiLetters]

import Letters exposing [AsciiLetter, emptyLetter, charToAsciiLetter]


strToAsciiLetters = \str ->
    Str.toUtf8 str |> List.map \char -> charToAsciiLetter char

lettersToStr : List AsciiLetter -> Str
lettersToStr = \letters ->
    lettersJoined = List.walk letters emptyLetter \acc, letter ->
        overlap = List.min [getOverlap acc letter, acc.maxTailOverlap, letter.maxHeadOverlap] 
            |> Result.withDefault 0
        when (acc.rows, letter.rows) is
            ([row0, row1, row2, row3, row4, row5], [let0, let1, let2, let3, let4, let5]) ->
                {
                    rows: [
                        joinLetterRows row0 let0 overlap,
                        joinLetterRows row1 let1 overlap,
                        joinLetterRows row2 let2 overlap,
                        joinLetterRows row3 let3 overlap,
                        joinLetterRows row4 let4 overlap,
                        joinLetterRows row5 let5 overlap,
                    ],
                    maxHeadOverlap: acc.maxHeadOverlap,
                    maxTailOverlap: letter.maxTailOverlap,
                }

            _ -> acc
    lettersJoined.rows
    |> List.map
        (\row -> row
            |> Str.fromUtf8
            |> Result.withDefault "")
    |> Str.joinWith "\n"

joinLetterRows : List U8, List U8, U8 -> List U8
joinLetterRows = \row1, row2, overlap ->
    when (row1, row2) is
        ([], []) -> []
        (_, []) -> row1
        ([], _) -> row2
        ([..as xs, x], [y, ..as ys]) ->
            if overlap > 1 then
                if y == ' ' then
                    joinLetterRows row1 ys (overlap - 1)
                else 
                    joinLetterRows xs row2 (overlap - 1)
            else if overlap == 1 then
                keep = if x == ')' && y == '(' then 
                        '|'
                    else if characterPriority x > characterPriority y then 
                        x 
                    else 
                        y
                List.join [xs, [keep], ys]
            else
                List.concat row1 row2

getOverlap : AsciiLetter, AsciiLetter -> U8
getOverlap = \letter1, letter2 ->
    edges1 = letter1.rows
        |> List.map \row ->
            List.reverse row
            |> List.walkUntil (0, ' ') \(edgePos, _), char -> 
                if char == ' ' then Continue (edgePos + 1, char) else Break (edgePos, char)
    edges2 = letter2.rows
        |> List.map \row ->
            List.walkUntil row (0, ' ') \(edgePos, _), char -> 
                if char == ' ' then Continue (edgePos + 1, char) else Break (edgePos, char)
    List.map2 edges1 edges2 \(pos1, ch1), (pos2, ch2) ->
        if (ch1 == '\\' && ch2 == '/') || (ch1 == '/' && ch2 == '\\') then pos1 + pos2 else pos1 + pos2 + 1
    |> List.min
    |> Result.withDefault 0
            
expect
    overlap = getOverlap Letters.lowerA Letters.lowerA 
    overlap == 1
expect
    overlap = getOverlap Letters.lowerA Letters.upperA 
    overlap == 1
expect
    overlap = getOverlap Letters.upperA Letters.upperA 
    overlap == 0
expect
    overlap = getOverlap Letters.upperA Letters.lowerA 
    overlap == 2
expect 
    overlap = getOverlap Letters.upperV Letters.lowerA
    overlap == 3
expect
    overlap = getOverlap Letters.upperA Letters.upperV
    overlap == 4
expect
    overlap = getOverlap Letters.upperV Letters.upperA
    overlap == 4
    
characterPriority : U8 -> U8
characterPriority = \c ->
    when c is
        '(' -> 4
        ')' -> 4
        '\\' -> 3
        '/' -> 3
        '|' -> 2
        ' ' -> 0
        _ -> 1