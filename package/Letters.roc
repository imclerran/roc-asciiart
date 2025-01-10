## ```
##  _         _   _
## | |    ___| |_| |_ ___ _ __ ___   _ __ ___   ___
## | |   / _ \ __| __/ _ \ '__/ __| | '__/ _ \ / __|
## | |__|  __/ |_| ||  __/ |  \__ \_| | | (_) | (__
## |_____\___|\__|\__\___|_|  |___(_)_|  \___/ \___|
## ```
## Includes the AsciiLetter object, a function to convert a char to an AsciiLetter object, and an empty AsciiLetter object.
module [
    AsciiLetter,
    char_to_ascii_letter,
    empty_letter,
]

## ```
## AsciiLetter : {
##     rows : List (List U8),
##     maxHeadOverlap: U8,
##     maxTailOverlap: U8,
## }
## ```
AsciiLetter : {
    rows : List (List U8),
    max_head_overlap : U8,
    max_tail_overlap : U8,
}

## Convert a char byte to an AsciiLetter object.
##
## Possible chars are:
## - All letters (upper and lower case)
## - Numbers 0-9
## - Space
## - Symbols:
##   - ! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ` { | } ~
char_to_ascii_letter : U8 -> AsciiLetter
char_to_ascii_letter = \char -> Dict.get(letter_dict, char) |> Result.with_default(empty_letter)

## Dictionary mapping chars to AsciiLetter objects.
letter_dict =
    Dict.empty({})
    |> Dict.insert(' ', space)
    |> Dict.insert('!', exclamation_mark)
    |> Dict.insert('"', quotation_mark)
    |> Dict.insert('#', number_sign)
    |> Dict.insert('$', dollar_sign)
    |> Dict.insert('%', percent_sign)
    |> Dict.insert('&', ampersand)
    |> Dict.insert('\'', apostrophe)
    |> Dict.insert('(', round_open_bracket)
    |> Dict.insert(')', round_close_bracket)
    |> Dict.insert('*', asterisk)
    |> Dict.insert('+', plus_sign)
    |> Dict.insert(',', comma)
    |> Dict.insert('-', hyphen)
    |> Dict.insert('.', full_stop)
    |> Dict.insert('/', forward_slash)
    |> Dict.insert(':', colon)
    |> Dict.insert(';', semi_colon)
    |> Dict.insert('<', less_than_sign)
    |> Dict.insert('=', equals_sign)
    |> Dict.insert('>', greater_than_sign)
    |> Dict.insert('?', question_mark)
    |> Dict.insert('@', at_sign)
    |> Dict.insert('[', square_open_bracket)
    |> Dict.insert('\\', back_slash)
    |> Dict.insert(']', square_close_bracket)
    |> Dict.insert('^', caret)
    |> Dict.insert('_', underscore)
    |> Dict.insert('`', grave_accent)
    |> Dict.insert('{', curly_open_bracket)
    |> Dict.insert('|', vertical_bar)
    |> Dict.insert('}', curly_close_bracket)
    |> Dict.insert('~', tilde)
    |> Dict.insert('0', number_zero)
    |> Dict.insert('1', number_one)
    |> Dict.insert('2', number_two)
    |> Dict.insert('3', number_three)
    |> Dict.insert('4', number_four)
    |> Dict.insert('5', number_five)
    |> Dict.insert('6', number_six)
    |> Dict.insert('7', number_seven)
    |> Dict.insert('8', number_eight)
    |> Dict.insert('9', number_nine)
    |> Dict.insert('A', upper_a)
    |> Dict.insert('B', upper_b)
    |> Dict.insert('C', upper_c)
    |> Dict.insert('D', upper_d)
    |> Dict.insert('E', upper_e)
    |> Dict.insert('F', upper_f)
    |> Dict.insert('G', upper_g)
    |> Dict.insert('H', upper_h)
    |> Dict.insert('I', upper_i)
    |> Dict.insert('J', upper_j)
    |> Dict.insert('K', upper_k)
    |> Dict.insert('L', upper_l)
    |> Dict.insert('M', upper_m)
    |> Dict.insert('N', upper_n)
    |> Dict.insert('O', upper_o)
    |> Dict.insert('P', upper_p)
    |> Dict.insert('Q', upper_q)
    |> Dict.insert('R', upper_r)
    |> Dict.insert('S', upper_s)
    |> Dict.insert('T', upper_t)
    |> Dict.insert('U', upper_u)
    |> Dict.insert('V', upper_v)
    |> Dict.insert('W', upper_w)
    |> Dict.insert('X', upper_x)
    |> Dict.insert('Y', upper_y)
    |> Dict.insert('Z', upper_z)
    |> Dict.insert('a', lower_a)
    |> Dict.insert('b', lower_b)
    |> Dict.insert('c', lower_c)
    |> Dict.insert('d', lower_d)
    |> Dict.insert('e', lower_e)
    |> Dict.insert('f', lower_f)
    |> Dict.insert('g', lower_g)
    |> Dict.insert('h', lower_h)
    |> Dict.insert('i', lower_i)
    |> Dict.insert('j', lower_j)
    |> Dict.insert('k', lower_k)
    |> Dict.insert('l', lower_l)
    |> Dict.insert('m', lower_m)
    |> Dict.insert('n', lower_n)
    |> Dict.insert('o', lower_o)
    |> Dict.insert('p', lower_p)
    |> Dict.insert('q', lower_q)
    |> Dict.insert('r', lower_r)
    |> Dict.insert('s', lower_s)
    |> Dict.insert('t', lower_t)
    |> Dict.insert('u', lower_u)
    |> Dict.insert('v', lower_v)
    |> Dict.insert('w', lower_w)
    |> Dict.insert('x', lower_x)
    |> Dict.insert('y', lower_y)
    |> Dict.insert('z', lower_z)

## An empty AsciiLetter object with empty rows and 0 head and tail overlap.
empty_letter : AsciiLetter
empty_letter = {
    rows: [
        [],
        [],
        [],
        [],
        [],
        [],
    ],
    max_head_overlap: 0,
    max_tail_overlap: 0,
}

space : AsciiLetter
space = {
    rows: [
        [32],
        [32],
        [32],
        [32],
        [32],
        [32],
    ],
    max_head_overlap: 0,
    max_tail_overlap: 0,
}

exclamation_mark : AsciiLetter
exclamation_mark = {
    rows: [
        [' ', '_', ' '],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', '_', '|'],
        ['(', '_', ')'],
        [' ', ' ', ' '],
    ],
    max_head_overlap: 3,
    max_tail_overlap: 3,
}

quotation_mark : AsciiLetter
quotation_mark = {
    rows: [
        [' ', '_', ' ', '_', ' '],
        ['(', ' ', '|', ' ', ')'],
        [' ', 'V', ' ', 'V', ' '],
        [' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 3,
    max_tail_overlap: 3,
}

number_sign : AsciiLetter
number_sign = {
    rows: [
        [' ', ' ', ' ', '_', ' ', ' ', '_', ' ', ' ', ' '],
        [' ', '_', '|', ' ', '|', '|', ' ', '|', '_', ' '],
        ['|', '_', ' ', ' ', '.', '.', ' ', ' ', '_', '|'],
        ['|', '_', ' ', ' ', ' ', ' ', ' ', ' ', '_', '|'],
        [' ', ' ', '|', '_', '|', '|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 10,
    max_tail_overlap: 10,
}

dollar_sign : AsciiLetter
dollar_sign = {
    rows: [
        [' ', ' ', '_', ' ', ' '],
        [' ', '|', ' ', '|', ' '],
        ['/', ' ', '_', '_', ')'],
        ['\\', '_', '_', ' ', '\\'],
        ['(', ' ', ' ', ' ', '/'],
        [' ', '|', '_', '|', ' '],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}

percent_sign : AsciiLetter
percent_sign = {
    rows: [
        [' ', '_', ' ', ' ', '_', '_'],
        ['(', '_', ')', '/', ' ', '/'],
        [' ', ' ', '/', ' ', '/', ' '],
        [' ', '/', ' ', '/', '_', ' '],
        ['/', '_', '/', '(', '_', ')'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

ampersand : AsciiLetter
ampersand = {
    rows: [
        [' ', ' ', '_', '_', '_', ' ', ' ', ' '],
        [' ', '(', ' ', '_', ' ', ')', ' ', ' '],
        [' ', '/', ' ', '_', ' ', '\\', '/', '\\'],
        ['|', ' ', '(', '_', '>', ' ', ' ', '<'],
        [' ', '\\', '_', '_', '_', '/', '\\', '/'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 8,
    max_tail_overlap: 8,
}

apostrophe : AsciiLetter
apostrophe = {
    rows: [
        [' ', '_', ' '],
        ['(', ' ', ')'],
        ['|', '/', ' '],
        [' ', ' ', ' '],
        [' ', ' ', ' '],
        [' ', ' ', ' '],
    ],
    max_head_overlap: 2,
    max_tail_overlap: 2,
}

round_open_bracket : AsciiLetter
round_open_bracket = {
    rows: [
        [' ', ' ', '_', '_'],
        [' ', '/', ' ', '/'],
        ['|', ' ', '|', ' '],
        ['|', ' ', '|', ' '],
        ['|', ' ', '|', ' '],
        [' ', '\\', '_', '\\'],
    ],
    max_head_overlap: 4,
    max_tail_overlap: 4,
}

round_close_bracket : AsciiLetter
round_close_bracket = {
    rows: [
        ['_', '_', ' ', ' '],
        ['\\', ' ', '\\', ' '],
        [' ', '|', ' ', '|'],
        [' ', '|', ' ', '|'],
        [' ', '|', ' ', '|'],
        ['/', '_', '/', ' '],
    ],
    max_head_overlap: 4,
    max_tail_overlap: 4,
}

asterisk : AsciiLetter
asterisk = {
    rows: [
        ['_', '_', '/', '\\', '_', '_'],
        ['\\', ' ', ' ', ' ', ' ', '/'],
        ['/', '_', ' ', ' ', '_', '\\'],
        [' ', ' ', '\\', '/', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

plus_sign : AsciiLetter
plus_sign = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', '_', ' ', ' ', ' '],
        [' ', '_', '|', ' ', '|', '_', ' '],
        ['|', '_', ' ', ' ', ' ', '_', '|'],
        [' ', ' ', '|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

comma : AsciiLetter
comma = {
    rows: [
        [' ', ' ', ' '],
        [' ', ' ', ' '],
        [' ', ' ', ' '],
        [' ', '_', ' '],
        ['(', ' ', ')'],
        ['|', '/', ' '],
    ],
    max_head_overlap: 2,
    max_tail_overlap: 2,
}

hyphen : AsciiLetter
hyphen = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', '_', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

full_stop : AsciiLetter
full_stop = {
    rows: [
        [' ', ' ', ' '],
        [' ', ' ', ' '],
        [' ', ' ', ' '],
        [' ', '_', ' '],
        ['(', '_', ')'],
        [' ', ' ', ' '],
    ],
    max_head_overlap: 2,
    max_tail_overlap: 2,
}

forward_slash : AsciiLetter
forward_slash = {
    rows: [
        [' ', ' ', ' ', ' ', '_', '_'],
        [' ', ' ', ' ', '/', ' ', '/'],
        [' ', ' ', '/', ' ', '/', ' '],
        [' ', '/', ' ', '/', ' ', ' '],
        ['/', '_', '/', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

colon : AsciiLetter
colon = {
    rows: [
        [' ', ' ', ' '],
        [' ', '_', ' '],
        ['(', '_', ')'],
        [' ', '_', ' '],
        ['(', '_', ')'],
        [' ', ' ', ' '],
    ],
    max_head_overlap: 1,
    max_tail_overlap: 1,
}

semi_colon : AsciiLetter
semi_colon = {
    rows: [
        [' ', ' ', ' '],
        [' ', '_', ' '],
        ['(', '_', ')'],
        [' ', '_', ' '],
        ['(', ' ', ')'],
        ['|', '/', ' '],
    ],
    max_head_overlap: 1,
    max_tail_overlap: 1,
}

less_than_sign : AsciiLetter
less_than_sign = {
    rows: [
        [' ', ' ', '_', '_'],
        [' ', '/', ' ', '/'],
        ['/', ' ', '/', ' '],
        ['\\', ' ', '\\', ' '],
        [' ', '\\', '_', '\\'],
        [' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 4,
    max_tail_overlap: 4,
}

equals_sign : AsciiLetter
equals_sign = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', '_', '_', '_', '_', '_', '|'],
        ['|', '_', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

greater_than_sign : AsciiLetter
greater_than_sign = {
    rows: [
        ['_', '_', ' ', ' '],
        ['\\', ' ', '\\', ' '],
        [' ', '\\', ' ', '\\'],
        [' ', '/', ' ', '/'],
        ['/', '_', '/', ' '],
        [' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 4,
    max_tail_overlap: 4,
}

question_mark : AsciiLetter
question_mark = {
    rows: [
        [' ', '_', '_', '_', ' '],
        ['|', '_', '_', ' ', '\\'],
        [' ', ' ', '/', ' ', '/'],
        [' ', '|', '_', '|', ' '],
        [' ', '(', '_', ')', ' '],
        [' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}

at_sign : AsciiLetter
at_sign = {
    rows: [
        [' ', ' ', ' ', '_', '_', '_', '_', ' ', ' '],
        [' ', ' ', '/', ' ', '_', '_', ' ', '\\', ' '],
        [' ', '/', ' ', '/', ' ', '_', '`', ' ', '|'],
        ['|', ' ', '|', ' ', '(', '_', '|', ' ', '|'],
        [' ', '\\', ' ', '\\', '_', '_', ',', '_', '|'],
        [' ', ' ', '\\', '_', '_', '_', '_', '/', ' '],
    ],
    max_head_overlap: 9,
    max_tail_overlap: 9,
}

square_open_bracket : AsciiLetter
square_open_bracket = {
    rows: [
        [' ', '_', '_', ' '],
        ['|', ' ', '_', '|'],
        ['|', ' ', '|', ' '],
        ['|', ' ', '|', ' '],
        ['|', ' ', '|', ' '],
        ['|', '_', '_', '|'],
    ],
    max_head_overlap: 4,
    max_tail_overlap: 4,
}

back_slash : AsciiLetter
back_slash = {
    rows: [
        ['_', '_', ' ', ' ', ' ', ' '],
        ['\\', ' ', '\\', ' ', ' ', ' '],
        [' ', '\\', ' ', '\\', ' ', ' '],
        [' ', ' ', '\\', ' ', '\\', ' '],
        [' ', ' ', ' ', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

square_close_bracket : AsciiLetter
square_close_bracket = {
    rows: [
        [' ', '_', '_', ' '],
        ['|', '_', ' ', '|'],
        [' ', '|', ' ', '|'],
        [' ', '|', ' ', '|'],
        [' ', '|', ' ', '|'],
        ['|', '_', '_', '|'],
    ],
    max_head_overlap: 4,
    max_tail_overlap: 4,
}

caret : AsciiLetter
caret = {
    rows: [
        [' ', '/', '\\', ' '],
        ['|', '/', '\\', '|'],
        [' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 4,
    max_tail_overlap: 4,
}

underscore : AsciiLetter
underscore = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', '_', '_', '_', '_', '_', '|'],
    ],
    max_head_overlap: 2,
    max_tail_overlap: 2,
}

grave_accent : AsciiLetter
grave_accent = {
    rows: [
        [' ', '_', ' '],
        ['(', ' ', ')'],
        [' ', '\\', '|'],
        [' ', ' ', ' '],
        [' ', ' ', ' '],
        [' ', ' ', ' '],
    ],
    max_head_overlap: 1,
    max_tail_overlap: 1,
}

curly_open_bracket : AsciiLetter
curly_open_bracket = {
    rows: [
        [' ', ' ', ' ', '_', '_'],
        [' ', ' ', '/', ' ', '/'],
        [' ', '|', ' ', '|', ' '],
        ['<', ' ', '<', ' ', ' '],
        [' ', '|', ' ', '|', ' '],
        [' ', ' ', '\\', '_', '\\'],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}

vertical_bar : AsciiLetter
vertical_bar = {
    rows: [
        [' ', '_', ' '],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', '_', '|'],
    ],
    max_head_overlap: 3,
    max_tail_overlap: 3,
}

curly_close_bracket : AsciiLetter
curly_close_bracket = {
    rows: [
        ['_', '_', ' ', ' ', ' '],
        ['\\', ' ', '\\', ' ', ' '],
        [' ', '|', ' ', '|', ' '],
        [' ', ' ', '>', ' ', '>'],
        [' ', '|', ' ', '|', ' '],
        ['/', '_', '/', ' ', ' '],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}

tilde : AsciiLetter
tilde = {
    rows: [
        [' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' '],
        [' ', '/', '\\', '/', '|'],
        ['|', '/', '\\', '/', ' '],
        [' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}

number_zero : AsciiLetter
number_zero = {
    rows: [
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

number_one : AsciiLetter
number_one = {
    rows: [
        [' ', '_', ' '],
        ['/', ' ', '|'],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', '_', '|'],
        [' ', ' ', ' '],
    ],
    max_head_overlap: 3,
    max_tail_overlap: 3,
}

number_two : AsciiLetter
number_two = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', '_', '_', '_', ' ', '\\', ' '],
        [' ', ' ', '_', '_', ')', ' ', '|'],
        [' ', '/', ' ', '_', '_', '/', ' '],
        ['|', '_', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

number_three : AsciiLetter
number_three = {
    rows: [
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', '_', '_', '_', ' ', '/', ' '],
        [' ', ' ', '|', '_', ' ', '\\', ' '],
        [' ', '_', '_', '_', ')', ' ', '|'],
        ['|', '_', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

number_four : AsciiLetter
number_four = {
    rows: [
        [' ', '_', ' ', ' ', '_', ' ', ' ', ' '],
        ['|', ' ', '|', '|', ' ', '|', ' ', ' '],
        ['|', ' ', '|', '|', ' ', '|', '_', ' '],
        ['|', '_', '_', ' ', ' ', ' ', '_', '|'],
        [' ', ' ', ' ', '|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 8,
    max_tail_overlap: 8,
}

number_five : AsciiLetter
number_five = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', ' ', '_', '_', '_', '|', ' '],
        ['|', '_', '_', '_', ' ', '\\', ' '],
        [' ', '_', '_', '_', ')', ' ', '|'],
        ['|', '_', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

number_six : AsciiLetter
number_six = {
    rows: [
        [' ', ' ', '_', '_', ' ', ' ', ' '],
        [' ', '/', ' ', '/', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '\\', ' '],
        ['|', ' ', '(', '_', ')', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

number_seven : AsciiLetter
number_seven = {
    rows: [
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', '_', '_', '_', ' ', ' ', '|'],
        [' ', ' ', ' ', '/', ' ', '/', ' '],
        [' ', ' ', '/', ' ', '/', ' ', ' '],
        [' ', '/', '_', '/', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

number_eight : AsciiLetter
number_eight = {
    rows: [
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '(', ' ', '_', ' ', ')', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '(', '_', ')', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

number_nine : AsciiLetter
number_nine = {
    rows: [
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '(', '_', ')', ' ', '|'],
        [' ', '\\', '_', '_', ',', ' ', '|'],
        [' ', ' ', ' ', '/', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_a : AsciiLetter
upper_a = {
    rows: [
        [' ', ' ', ' ', ' ', '_', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', '/', ' ', '\\', ' ', ' ', ' '],
        [' ', ' ', '/', ' ', '_', ' ', '\\', ' ', ' '],
        [' ', '/', ' ', '_', '_', '_', ' ', '\\', ' '],
        ['/', '_', '/', ' ', ' ', ' ', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 9,
    max_tail_overlap: 9,
}

upper_b : AsciiLetter
upper_b = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', ' ', '_', '_', ' ', ')', ' '],
        ['|', ' ', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', '_', ')', ' ', '|'],
        ['|', '_', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_c : AsciiLetter
upper_c = {
    rows: [
        [' ', ' ', '_', '_', '_', '_', ' '],
        [' ', '/', ' ', '_', '_', '_', '|'],
        ['|', ' ', '|', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', '_', '_', '_', ' '],
        [' ', '\\', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_d : AsciiLetter
upper_d = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', ' ', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        ['|', '_', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_e : AsciiLetter
upper_e = {
    rows: [
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', ' ', '_', '_', '_', '_', '|'],
        ['|', ' ', ' ', '_', '|', ' ', ' '],
        ['|', ' ', '|', '_', '_', '_', ' '],
        ['|', '_', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_f : AsciiLetter
upper_f = {
    rows: [
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', ' ', ' ', '_', '_', '_', '|'],
        ['|', ' ', '|', '_', ' ', ' ', ' '],
        ['|', ' ', ' ', '_', '|', ' ', ' '],
        ['|', '_', '|', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_g : AsciiLetter
upper_g = {
    rows: [
        [' ', ' ', '_', '_', '_', '_', ' '],
        [' ', '/', ' ', '_', '_', '_', '|'],
        ['|', ' ', '|', ' ', ' ', '_', ' '],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_h : AsciiLetter
upper_h = {
    rows: [
        [' ', '_', ' ', ' ', ' ', '_', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        ['|', ' ', ' ', '_', ' ', ' ', '|'],
        ['|', '_', '|', ' ', '|', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_i : AsciiLetter
upper_i = {
    rows: [
        [' ', '_', '_', '_', ' '],
        ['|', '_', ' ', '_', '|'],
        [' ', '|', ' ', '|', ' '],
        [' ', '|', ' ', '|', ' '],
        ['|', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}

upper_j : AsciiLetter
upper_j = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', '_', ' '],
        [' ', ' ', ' ', ' ', '|', ' ', '|'],
        [' ', '_', ' ', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}

upper_k : AsciiLetter
upper_k = {
    rows: [
        [' ', '_', ' ', ' ', '_', '_'],
        ['|', ' ', '|', '/', ' ', '/'],
        ['|', ' ', '\'', ' ', '/', ' '],
        ['|', ' ', '.', ' ', '\\', ' '],
        ['|', '_', '|', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

upper_l : AsciiLetter
upper_l = {
    rows: [
        [' ', '_', ' ', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', '_', '_', '_', ' '],
        ['|', '_', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_m : AsciiLetter
upper_m = {
    rows: [
        [' ', '_', '_', ' ', ' ', '_', '_', ' '],
        ['|', ' ', ' ', '\\', '/', ' ', ' ', '|'],
        ['|', ' ', '|', '\\', '/', '|', ' ', '|'],
        ['|', ' ', '|', ' ', ' ', '|', ' ', '|'],
        ['|', '_', '|', ' ', ' ', '|', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 8,
    max_tail_overlap: 8,
}

upper_n : AsciiLetter
upper_n = {
    rows: [
        [' ', '_', ' ', ' ', ' ', '_', ' '],
        ['|', ' ', '\\', ' ', '|', ' ', '|'],
        ['|', ' ', ' ', '\\', '|', ' ', '|'],
        ['|', ' ', '|', '\\', ' ', ' ', '|'],
        ['|', '_', '|', ' ', '\\', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_o : AsciiLetter
upper_o = {
    rows: [
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_p : AsciiLetter
upper_p = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', ' ', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', '_', ')', ' ', '|'],
        ['|', ' ', ' ', '_', '_', '/', ' '],
        ['|', '_', '|', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_q : AsciiLetter
upper_q = {
    rows: [
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_r : AsciiLetter
upper_r = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', ' ', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', '_', ')', ' ', '|'],
        ['|', ' ', ' ', '_', ' ', '<', ' '],
        ['|', '_', '|', ' ', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_s : AsciiLetter
upper_s = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['/', ' ', '_', '_', '_', '|', ' '],
        ['\\', '_', '_', '_', ' ', '\\', ' '],
        [' ', '_', '_', '_', ')', ' ', '|'],
        ['|', '_', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_t : AsciiLetter
upper_t = {
    rows: [
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', '_', ' ', ' ', ' ', '_', '|'],
        [' ', ' ', '|', ' ', '|', ' ', ' '],
        [' ', ' ', '|', ' ', '|', ' ', ' '],
        [' ', ' ', '|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_u : AsciiLetter
upper_u = {
    rows: [
        [' ', '_', ' ', ' ', ' ', '_', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_v : AsciiLetter
upper_v = {
    rows: [
        ['_', '_', ' ', ' ', ' ', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', ' ', ' ', ' ', '/', ' ', '/'],
        [' ', '\\', ' ', '\\', ' ', '/', ' ', '/', ' '],
        [' ', ' ', '\\', ' ', 'V', ' ', '/', ' ', ' '],
        [' ', ' ', ' ', '\\', '_', '/', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 9,
    max_tail_overlap: 9,
}

upper_w : AsciiLetter
upper_w = {
    rows: [
        ['_', '_', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', ' ', ' ', ' ', ' ', ' ', ' ', '/', ' ', '/'],
        [' ', '\\', ' ', '\\', ' ', '/', '\\', ' ', '/', ' ', '/', ' '],
        [' ', ' ', '\\', ' ', 'V', ' ', ' ', 'V', ' ', '/', ' ', ' '],
        [' ', ' ', ' ', '\\', '_', '/', '\\', '_', '/', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 12,
    max_tail_overlap: 12,
}

upper_x : AsciiLetter
upper_x = {
    rows: [
        ['_', '_', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', '/', ' ', '/'],
        [' ', '\\', ' ', ' ', '/', ' '],
        [' ', '/', ' ', ' ', '\\', ' '],
        ['/', '_', '/', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

upper_y : AsciiLetter
upper_y = {
    rows: [
        ['_', '_', ' ', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', ' ', '/', ' ', '/'],
        [' ', '\\', ' ', 'V', ' ', '/', ' '],
        [' ', ' ', '|', ' ', '|', ' ', ' '],
        [' ', ' ', '|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

upper_z : AsciiLetter
upper_z = {
    rows: [
        [' ', '_', '_', '_', '_', '_'],
        ['|', '_', '_', ' ', ' ', '/'],
        [' ', ' ', '/', ' ', '/', ' '],
        [' ', '/', ' ', '/', '_', ' '],
        ['/', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

lower_a : AsciiLetter
lower_a = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', '_', '_', ' ', '_', ' '],
        [' ', '/', ' ', '_', '`', ' ', '|'],
        ['|', ' ', '(', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_b : AsciiLetter
lower_b = {
    rows: [
        [' ', '_', ' ', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', '_', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '\\', ' '],
        ['|', ' ', '|', '_', ')', ' ', '|'],
        ['|', '_', '.', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_c : AsciiLetter
lower_c = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', '_', '_', '_', ' '],
        [' ', '/', ' ', '_', '_', '|'],
        ['|', ' ', '(', '_', '_', ' '],
        [' ', '\\', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

lower_d : AsciiLetter
lower_d = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', '_', ' '],
        [' ', ' ', '_', '_', '|', ' ', '|'],
        [' ', '/', ' ', '_', '`', ' ', '|'],
        ['|', ' ', '(', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_e : AsciiLetter
lower_e = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', '_', '_', '_', ' '],
        [' ', '/', ' ', '_', ' ', '\\'],
        ['|', ' ', ' ', '_', '_', '/'],
        [' ', '\\', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

lower_f : AsciiLetter
lower_f = {
    rows: [
        [' ', ' ', '_', '_', ' '],
        [' ', '/', ' ', '_', '|'],
        ['|', ' ', '|', '_', ' '],
        ['|', ' ', ' ', '_', '|'],
        ['|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}

lower_g : AsciiLetter
lower_g = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', '_', '_', ' ', '_', ' '],
        [' ', '/', ' ', '_', '`', ' ', '|'],
        ['|', ' ', '(', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', ' ', '|'],
        [' ', '|', '_', '_', '_', '/', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_h : AsciiLetter
lower_h = {
    rows: [
        [' ', '_', ' ', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', '_', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', '_', '|', ' ', '|', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_i : AsciiLetter
lower_i = {
    rows: [
        [' ', '_', ' '],
        ['(', '_', ')'],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', '_', '|'],
        [' ', ' ', ' '],
    ],
    max_head_overlap: 3,
    max_tail_overlap: 3,
}

lower_j : AsciiLetter
lower_j = {
    rows: [
        [' ', ' ', ' ', '_', ' '],
        [' ', ' ', '(', '_', ')'],
        [' ', ' ', '|', ' ', '|'],
        [' ', ' ', '|', ' ', '|'],
        [' ', '_', '/', ' ', '|'],
        ['|', '_', '_', '/', ' '],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}

lower_k : AsciiLetter
lower_k = {
    rows: [
        [' ', '_', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', ' ', '_', '_'],
        ['|', ' ', '|', '/', ' ', '/'],
        ['|', ' ', ' ', ' ', '<', ' '],
        ['|', '_', '|', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

lower_l : AsciiLetter
lower_l = {
    rows: [
        [' ', '_', ' '],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', '_', '|'],
        [' ', ' ', ' '],
    ],
    max_head_overlap: 3,
    max_tail_overlap: 3,
}

lower_m : AsciiLetter
lower_m = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', ' ', '_', '_', ' ', '_', '_', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '`', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', '_', '|', ' ', '|', '_', '|', ' ', '|', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 11,
    max_tail_overlap: 11,
}

lower_n : AsciiLetter
lower_n = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', ' ', '_', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', '_', '|', ' ', '|', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_o : AsciiLetter
lower_o = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '(', '_', ')', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_p : AsciiLetter
lower_p = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', ' ', '_', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '\\', ' '],
        ['|', ' ', '|', '_', ')', ' ', '|'],
        ['|', ' ', '.', '_', '_', '/', ' '],
        ['|', '_', '|', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_q : AsciiLetter
lower_q = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', '_', '_', ' ', '_', ' '],
        [' ', '/', ' ', '_', '`', ' ', '|'],
        ['|', ' ', '(', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', ' ', '|'],
        [' ', ' ', ' ', ' ', '|', '_', '|'],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_r : AsciiLetter
lower_r = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', ' ', '_', '_', ' '],
        ['|', ' ', '\'', '_', '_', '|'],
        ['|', ' ', '|', ' ', ' ', ' '],
        ['|', '_', '|', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

lower_s : AsciiLetter
lower_s = {
    rows: [
        [' ', ' ', ' ', ' ', ' '],
        [' ', '_', '_', '_', ' '],
        ['/', ' ', '_', '_', '|'],
        ['\\', '_', '_', ' ', '\\'],
        ['|', '_', '_', '_', '/'],
        [' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}

lower_t : AsciiLetter
lower_t = {
    rows: [
        [' ', '_', ' ', ' ', ' '],
        ['|', ' ', '|', '_', ' '],
        ['|', ' ', '_', '_', '|'],
        ['|', ' ', '|', '_', ' '],
        [' ', '\\', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}

lower_u : AsciiLetter
lower_u = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', ' ', ' ', ' ', '_', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_v : AsciiLetter
lower_v = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        ['_', '_', ' ', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', ' ', '/', ' ', '/'],
        [' ', '\\', ' ', 'V', ' ', '/', ' '],
        [' ', ' ', '\\', '_', '/', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_w : AsciiLetter
lower_w = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
        ['_', '_', ' ', ' ', ' ', ' ', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', ' ', '/', '\\', ' ', '/', ' ', '/'],
        [' ', '\\', ' ', 'V', ' ', ' ', 'V', ' ', '/', ' '],
        [' ', ' ', '\\', '_', '/', '\\', '_', '/', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 10,
    max_tail_overlap: 10,
}

lower_x : AsciiLetter
lower_x = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' '],
        ['_', '_', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', '/', ' ', '/'],
        [' ', '>', ' ', ' ', '<', ' '],
        ['/', '_', '/', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 6,
    max_tail_overlap: 6,
}

lower_y : AsciiLetter
lower_y = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', ' ', ' ', ' ', '_', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', ' ', '|'],
        [' ', '|', '_', '_', '_', '/', ' '],
    ],
    max_head_overlap: 7,
    max_tail_overlap: 7,
}

lower_z : AsciiLetter
lower_z = {
    rows: [
        [' ', ' ', ' ', ' ', ' '],
        [' ', '_', '_', '_', '_'],
        ['|', '_', ' ', ' ', '/'],
        [' ', '/', ' ', '/', ' '],
        ['/', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' '],
    ],
    max_head_overlap: 5,
    max_tail_overlap: 5,
}
