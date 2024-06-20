module [
    AsciiLetter, 
    charToAsciiLetter,
    emptyLetter,
    space,
    exclamationMark,
    quotationMark,
    numberSign,
    dollarSign,
    percentSign,
    ampersand,
    apostrophe,
    roundOpenBracket,
    roundCloseBracket,
    asterisk,
    plusSign,
    comma,
    hyphen,
    fullStop,
    forwardSlash,
    colon,
    semiColon,
    lessThanSign,
    equalsSign,
    greaterThanSign,
    questionMark,
    atSign,
    squareOpenBracket,
    backSlash,
    squareCloseBracket,
    caret,
    underscore,
    graveAccent,
    curlyOpenBracket,
    verticalBar,
    curlyCloseBracket,
    tilde,
    upperA,
    upperB,
    upperC,
    upperD,
    upperE,
    upperF,
    upperG,
    upperH,
    upperI,
    upperJ,
    upperK,
    upperL,
    upperM,
    upperN,
    upperO,
    upperP,
    upperQ,
    upperR,
    upperS,
    upperT,
    upperU,
    upperV,
    upperW,
    upperX,
    upperY,
    upperZ,
    lowerA,
    lowerB,
    lowerC,
    lowerD,
    lowerE,
    lowerF,
    lowerG,
    lowerH,
    lowerI,
    lowerJ,
    lowerK,
    lowerL,
    lowerM,
    lowerN,
    lowerO,
    lowerP,
    lowerQ,
    lowerR,
    lowerS,
    lowerT,
    lowerU,
    lowerV,
    lowerW,
    lowerX,
    lowerY,
    lowerZ,
]

charToAsciiLetter : U8 -> AsciiLetter
charToAsciiLetter = \char -> Dict.get letterDict char |> Result.withDefault emptyLetter


letterDict = Dict.empty {}
    |> Dict.insert ' ' space
    |> Dict.insert '!' exclamationMark
    |> Dict.insert '"' quotationMark
    |> Dict.insert '#' numberSign
    |> Dict.insert '$' dollarSign
    |> Dict.insert '%' percentSign
    |> Dict.insert '&' ampersand
    |> Dict.insert '\'' apostrophe
    |> Dict.insert '(' roundOpenBracket
    |> Dict.insert ')' roundCloseBracket
    |> Dict.insert '*' asterisk
    |> Dict.insert '+' plusSign
    |> Dict.insert ',' comma
    |> Dict.insert '-' hyphen
    |> Dict.insert '.' fullStop
    |> Dict.insert '/' forwardSlash
    |> Dict.insert ':' colon
    |> Dict.insert ';' semiColon
    |> Dict.insert '<' lessThanSign
    |> Dict.insert '=' equalsSign
    |> Dict.insert '>' greaterThanSign
    |> Dict.insert '?' questionMark
    |> Dict.insert '@' atSign
    |> Dict.insert '[' squareOpenBracket
    |> Dict.insert '\\' backSlash
    |> Dict.insert ']' squareCloseBracket
    |> Dict.insert '^' caret
    |> Dict.insert '_' underscore
    |> Dict.insert '`' graveAccent
    |> Dict.insert '{' curlyOpenBracket
    |> Dict.insert '|' verticalBar
    |> Dict.insert '}' curlyCloseBracket
    |> Dict.insert '~' tilde
    |> Dict.insert '0' numberZero
    |> Dict.insert '1' numberOne
    |> Dict.insert '2' numberTwo
    |> Dict.insert '3' numberThree
    |> Dict.insert '4' numberFour
    |> Dict.insert '5' numberFive
    |> Dict.insert '6' numberSix
    |> Dict.insert '7' numberSeven
    |> Dict.insert '8' numberEight
    |> Dict.insert '9' numberNine
    |> Dict.insert 'A' upperA
    |> Dict.insert 'B' upperB
    |> Dict.insert 'C' upperC
    |> Dict.insert 'D' upperD
    |> Dict.insert 'E' upperE
    |> Dict.insert 'F' upperF
    |> Dict.insert 'G' upperG
    |> Dict.insert 'H' upperH
    |> Dict.insert 'I' upperI
    |> Dict.insert 'J' upperJ
    |> Dict.insert 'K' upperK
    |> Dict.insert 'L' upperL
    |> Dict.insert 'M' upperM
    |> Dict.insert 'N' upperN
    |> Dict.insert 'O' upperO
    |> Dict.insert 'P' upperP
    |> Dict.insert 'Q' upperQ
    |> Dict.insert 'R' upperR
    |> Dict.insert 'S' upperS
    |> Dict.insert 'T' upperT
    |> Dict.insert 'U' upperU
    |> Dict.insert 'V' upperV
    |> Dict.insert 'W' upperW
    |> Dict.insert 'X' upperX
    |> Dict.insert 'Y' upperY
    |> Dict.insert 'Z' upperZ
    |> Dict.insert 'a' lowerA
    |> Dict.insert 'b' lowerB
    |> Dict.insert 'c' lowerC
    |> Dict.insert 'd' lowerD
    |> Dict.insert 'e' lowerE
    |> Dict.insert 'f' lowerF
    |> Dict.insert 'g' lowerG
    |> Dict.insert 'h' lowerH
    |> Dict.insert 'i' lowerI
    |> Dict.insert 'j' lowerJ
    |> Dict.insert 'k' lowerK
    |> Dict.insert 'l' lowerL
    |> Dict.insert 'm' lowerM
    |> Dict.insert 'n' lowerN
    |> Dict.insert 'o' lowerO
    |> Dict.insert 'p' lowerP
    |> Dict.insert 'q' lowerQ
    |> Dict.insert 'r' lowerR
    |> Dict.insert 's' lowerS
    |> Dict.insert 't' lowerT
    |> Dict.insert 'u' lowerU
    |> Dict.insert 'v' lowerV
    |> Dict.insert 'w' lowerW
    |> Dict.insert 'x' lowerX
    |> Dict.insert 'y' lowerY
    |> Dict.insert 'z' lowerZ

AsciiLetter : {
    rows : List (List U8),
    maxHeadOverlap: U8,
    maxTailOverlap: U8,
}

emptyLetter : AsciiLetter
emptyLetter = {
    rows: [
        [],
        [],
        [],
        [],
        [],
        [],
    ],
    maxHeadOverlap: 0,
    maxTailOverlap: 0,
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
    maxHeadOverlap: 0,
    maxTailOverlap: 0,
}

exclamationMark : AsciiLetter
exclamationMark = {
    rows: [
        [' ', '_', ' '],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', '_', '|'],
        ['(', '_', ')'],
        [' ', ' ', ' '],        
    ],
    maxHeadOverlap: 3,
    maxTailOverlap: 3,
}

quotationMark : AsciiLetter
quotationMark = {
    rows: [
        [' ', '_', ' ', '_', ' '],
        ['(', ' ', '|', ' ', ')'],
        [' ', 'V', ' ', 'V', ' '],
        [' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' '],        
    ],
    maxHeadOverlap: 2,
    maxTailOverlap: 2,
}

numberSign : AsciiLetter
numberSign = {
    rows: [
        [' ', ' ', ' ', '_', ' ', ' ', '_', ' ', ' ', ' '],
        [' ', '_', '|', ' ', '|', '|', ' ', '|', '_', ' '],
        ['|', '_', ' ', ' ', '.', '.', ' ', ' ', '_', '|'],
        ['|', '_', ' ', ' ', ' ', ' ', ' ', ' ', '_', '|'],
        [' ', ' ', '|', '_', '|', '|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 10,
    maxTailOverlap: 10,
}

dollarSign : AsciiLetter
dollarSign = {
    rows: [
        [' ', ' ', '_', ' ', ' '],
        [' ', '|', ' ', '|', ' '],
        ['/', ' ', '_', '_', ')'],
        ['\\', '_', '_', ' ', '\\'],
        ['(', ' ', ' ', ' ', '/'],
        [' ', '|', '_', '|', ' '],
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

percentSign : AsciiLetter
percentSign = {
    rows: [
        [' ', '_', ' ', ' ', '_', '_'],
        ['(', '_', ')', '/', ' ', '/'],
        [' ', ' ', '/', ' ', '/', ' '],
        [' ', '/', ' ', '/', '_', ' '],
        ['/', '_', '/', '(', '_', ')'],
        [' ', ' ', ' ', ' ', ' ', ' '],
        
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
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
    maxHeadOverlap: 8,
    maxTailOverlap: 8,
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
    maxHeadOverlap: 3,
    maxTailOverlap: 3,
}

roundOpenBracket : AsciiLetter
roundOpenBracket = {
    rows: [
        [' ', ' ', '_', '_'],
        [' ', '/', ' ', '/'],
        ['|', ' ', '|', ' '],
        ['|', ' ', '|', ' '],
        ['|', ' ', '|', ' '],
        [' ', '\\', '_', '\\'],
    ],
    maxHeadOverlap: 4,
    maxTailOverlap: 4,
}

roundCloseBracket : AsciiLetter
roundCloseBracket = {
    rows: [
        ['_', '_', ' ', ' '],
        ['\\', ' ', '\\', ' '],
        [' ', '|', ' ', '|'],
        [' ', '|', ' ', '|'],
        [' ', '|', ' ', '|'],
        ['/', '_', '/', ' '],
    ],
    maxHeadOverlap: 4,
    maxTailOverlap: 4,
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
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
}

plusSign : AsciiLetter
plusSign = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', '_', ' ', ' ', ' '],
        [' ', '_', '|', ' ', '|', '_', ' '],
        ['|', '_', ' ', ' ', ' ', '_', '|'],
        [' ', ' ', '|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],              
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
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
    maxHeadOverlap: 2,
    maxTailOverlap: 2,
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
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

fullStop : AsciiLetter
fullStop = {
    rows: [
        [' ', ' ', ' '],
        [' ', ' ', ' '],
        [' ', ' ', ' '],
        [' ', '_', ' '],
        ['(', '_', ')'],
        [' ', ' ', ' '],
    ],
    maxHeadOverlap: 2,
    maxTailOverlap: 2,
}

forwardSlash : AsciiLetter
forwardSlash = {
    rows: [
        [' ', ' ', ' ', ' ', '_', '_'],
        [' ', ' ', ' ', '/', ' ', '/'],
        [' ', ' ', '/', ' ', '/', ' '],
        [' ', '/', ' ', '/', ' ', ' '],
        ['/', '_', '/', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
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
    maxHeadOverlap: 1,
    maxTailOverlap: 1,
}

semiColon : AsciiLetter
semiColon = {
    rows: [
        [' ', ' ', ' '],
        [' ', '_', ' '],
        ['(', '_', ')'],
        [' ', '_', ' '],
        ['(', ' ', ')'],
        ['|', '/', ' '],
    ],
    maxHeadOverlap: 1,
    maxTailOverlap: 1,
}

lessThanSign : AsciiLetter
lessThanSign = {
    rows: [
        [' ', ' ', '_', '_'],
        [' ', '/', ' ', '/'],
        ['/', ' ', '/', ' '],
        ['\\', ' ', '\\', ' '],
        [' ', '\\', '_', '\\'],
        [' ', ' ', ' ', ' '],        
    ],
    maxHeadOverlap: 4,
    maxTailOverlap: 4,
}

equalsSign : AsciiLetter
equalsSign = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', '_', '_', '_', '_', '_', '|'],
        ['|', '_', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],      
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

greaterThanSign : AsciiLetter
greaterThanSign = {
    rows: [
        ['_', '_', ' ', ' '],
        ['\\', ' ', '\\', ' '],
        [' ', '\\', ' ', '\\'],
        [' ', '/', ' ', '/'],
        ['/', '_', '/', ' '],
        [' ', ' ', ' ', ' '],       
    ],
    maxHeadOverlap: 4,
    maxTailOverlap: 4,
}

questionMark : AsciiLetter
questionMark = {
    rows: [
        [' ', '_', '_', '_', ' '],
        ['|', '_', '_', ' ', '\\'],
        [' ', ' ', '/', ' ', '/'],
        [' ', '|', '_', '|', ' '],
        [' ', '(', '_', ')', ' '],
        [' ', ' ', ' ', ' ', ' '],       
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

atSign : AsciiLetter
atSign = {
    rows: [
        [' ', ' ', ' ', '_', '_', '_', '_', ' ', ' '],
        [' ', ' ', '/', ' ', '_', '_', ' ', '\\', ' '],
        [' ', '/', ' ', '/', ' ', '_', '`', ' ', '|'],
        ['|', ' ', '|', ' ', '(', '_', '|', ' ', '|'],
        [' ', '\\', ' ', '\\', '_', '_', ',', '_', '|'],
        [' ', ' ', '\\', '_', '_', '_', '_', '/', ' '],        
    ],
    maxHeadOverlap: 9,
    maxTailOverlap: 9,
}

squareOpenBracket : AsciiLetter
squareOpenBracket = {
    rows: [
        [' ', '_', '_', ' '],
        ['|', ' ', '_', '|'],
        ['|', ' ', '|', ' '],
        ['|', ' ', '|', ' '],
        ['|', ' ', '|', ' '],
        ['|', '_', '_', '|'],
    ],
    maxHeadOverlap: 4,
    maxTailOverlap: 4,
}

backSlash : AsciiLetter
backSlash = {
    rows: [
        ['_', '_', ' ', ' ', ' ', ' '],
        ['\\', ' ', '\\', ' ', ' ', ' '],
        [' ', '\\', ' ', '\\', ' ', ' '],
        [' ', ' ', '\\', ' ', '\\', ' '],
        [' ', ' ', ' ', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
}

squareCloseBracket : AsciiLetter
squareCloseBracket = {
    rows: [
        [' ', '_', '_', ' '],
        ['|', '_', ' ', '|'],
        [' ', '|', ' ', '|'],
        [' ', '|', ' ', '|'],
        [' ', '|', ' ', '|'],
        ['|', '_', '_', '|'],
    ],
    maxHeadOverlap: 4,
    maxTailOverlap: 4,
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
    maxHeadOverlap: 4,
    maxTailOverlap: 4,
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
    maxHeadOverlap: 2,
    maxTailOverlap: 2,
}

graveAccent : AsciiLetter
graveAccent = {
    rows: [
        [' ', '_', ' '],
        ['(', ' ', ')'],
        [' ', '\\', '|'],
        [' ', ' ', ' '],
        [' ', ' ', ' '],
        [' ', ' ', ' '],
    ],
    maxHeadOverlap: 1,
    maxTailOverlap: 1,
}

curlyOpenBracket : AsciiLetter
curlyOpenBracket = {
    rows: [
        [' ', ' ', ' ', '_', '_'],
        [' ', ' ', '/', ' ', '/'],
        [' ', '|', ' ', '|', ' '],
        ['<', ' ', '<', ' ', ' '],
        [' ', '|', ' ', '|', ' '],
        [' ', ' ', '\\', '_', '\\'],
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

verticalBar : AsciiLetter
verticalBar = {
    rows: [
        [' ', '_', ' '],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', '_', '|'],
    ],
    maxHeadOverlap: 3,
    maxTailOverlap: 3,
}

curlyCloseBracket : AsciiLetter
curlyCloseBracket = {
    rows: [
        ['_', '_', ' ', ' ', ' '],
        ['\\', ' ', '\\', ' ', ' '],
        [' ', '|', ' ', '|', ' '],
        [' ', ' ', '>', ' ', '>'],
        [' ', '|', ' ', '|', ' '],
        ['/', '_', '/', ' ', ' '],
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
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
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

numberZero : AsciiLetter
numberZero = {
    rows: [
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

numberOne : AsciiLetter
numberOne = {
    rows: [
        [' ', '_', ' '],
        ['/', ' ', '|'],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', '_', '|'],
        [' ', ' ', ' '],
    ],
    maxHeadOverlap: 3,
    maxTailOverlap: 3,
}

numberTwo : AsciiLetter
numberTwo = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', '_', '_', '_', ' ', '\\', ' '],
        [' ', ' ', '_', '_', ')', ' ', '|'],
        [' ', '/', ' ', '_', '_', '/', ' '],
        ['|', '_', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

numberThree : AsciiLetter
numberThree = {
    rows: [
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', '_', '_', '_', ' ', '/', ' '],
        [' ', ' ', '|', '_', ' ', '\\', ' '],
        [' ', '_', '_', '_', ')', ' ', '|'],
        ['|', '_', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

numberFour : AsciiLetter
numberFour = {
    rows: [
        [' ', '_', ' ', ' ', '_', ' ', ' ', ' '],
        ['|', ' ', '|', '|', ' ', '|', ' ', ' '],
        ['|', ' ', '|', '|', ' ', '|', '_', ' '],
        ['|', '_', '_', ' ', ' ', ' ', '_', '|'],
        [' ', ' ', ' ', '|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
        
    ],
    maxHeadOverlap: 8,
    maxTailOverlap: 8,
}

numberFive : AsciiLetter
numberFive = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', ' ', '_', '_', '_', '|', ' '],
        ['|', '_', '_', '_', ' ', '\\', ' '],
        [' ', '_', '_', '_', ')', ' ', '|'],
        ['|', '_', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

numberSix : AsciiLetter
numberSix = {
    rows: [
        [' ', ' ', '_', '_', ' ', ' ', ' '],
        [' ', '/', ' ', '/', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '\\', ' '],
        ['|', ' ', '(', '_', ')', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

numberSeven : AsciiLetter
numberSeven = {
    rows: [
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', '_', '_', '_', ' ', ' ', '|'],
        [' ', ' ', ' ', '/', ' ', '/', ' '],
        [' ', ' ', '/', ' ', '/', ' ', ' '],
        [' ', '/', '_', '/', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

numberEight : AsciiLetter
numberEight = {
    rows: [
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '(', ' ', '_', ' ', ')', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '(', '_', ')', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

numberNine : AsciiLetter
numberNine = {
    rows: [
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '(', '_', ')', ' ', '|'],
        [' ', '\\', '_', '_', ',', ' ', '|'],
        [' ', ' ', ' ', '/', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperA : AsciiLetter
upperA = {
    rows: [
        [' ', ' ', ' ', ' ', '_', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', '/', ' ', '\\', ' ', ' ', ' '],
        [' ', ' ', '/', ' ', '_', ' ', '\\', ' ', ' '],
        [' ', '/', ' ', '_', '_', '_', ' ', '\\', ' '],
        ['/', '_', '/', ' ', ' ', ' ', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 9,
    maxTailOverlap: 9,
}

upperB : AsciiLetter
upperB = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', ' ', '_', '_', ' ', ')', ' '],
        ['|', ' ', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', '_', ')', ' ', '|'],
        ['|', '_', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperC : AsciiLetter
upperC = {
    rows: [
        [' ', ' ', '_', '_', '_', '_', ' '],
        [' ', '/', ' ', '_', '_', '_', '|'],
        ['|', ' ', '|', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', '_', '_', '_', ' '],
        [' ', '\\', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperD : AsciiLetter
upperD = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', ' ', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        ['|', '_', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperE : AsciiLetter
upperE = {
    rows: [
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', ' ', '_', '_', '_', '_', '|'],
        ['|', ' ', ' ', '_', '|', ' ', ' '],
        ['|', ' ', '|', '_', '_', '_', ' '],
        ['|', '_', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperF : AsciiLetter
upperF = {
    rows: [
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', ' ', ' ', '_', '_', '_', '|'],
        ['|', ' ', '|', '_', ' ', ' ', ' '],
        ['|', ' ', ' ', '_', '|', ' ', ' '],
        ['|', '_', '|', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperG : AsciiLetter
upperG = {
    rows: [
        [' ', ' ', '_', '_', '_', '_', ' '],
        [' ', '/', ' ', '_', '_', '_', '|'],
        ['|', ' ', '|', ' ', ' ', '_', ' '],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperH : AsciiLetter
upperH = {
    rows: [
        [' ', '_', ' ', ' ', ' ', '_', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        ['|', ' ', ' ', '_', ' ', ' ', '|'],
        ['|', '_', '|', ' ', '|', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperI : AsciiLetter
upperI = {
    rows: [
        [' ', '_', '_', '_', ' '],
        ['|', '_', ' ', '_', '|'],
        [' ', '|', ' ', '|', ' '],
        [' ', '|', ' ', '|', ' '],
        ['|', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

upperJ : AsciiLetter
upperJ = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', '_', ' '],
        [' ', ' ', ' ', ' ', '|', ' ', '|'],
        [' ', '_', ' ', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

upperK : AsciiLetter
upperK = {
    rows: [
        [' ', '_', ' ', ' ', '_', '_'],
        ['|', ' ', '|', '/', ' ', '/'],
        ['|', ' ', '\'', ' ', '/', ' '],
        ['|', ' ', '.', ' ', '\\', ' '],
        ['|', '_', '|', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
}

upperL : AsciiLetter
upperL = {
    rows: [
        [' ', '_', ' ', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', '_', '_', '_', ' '],
        ['|', '_', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperM : AsciiLetter
upperM = {
    rows: [
        [' ', '_', '_', ' ', ' ', '_', '_', ' '],
        ['|', ' ', ' ', '\\', '/', ' ', ' ', '|'],
        ['|', ' ', '|', '\\', '/', '|', ' ', '|'],
        ['|', ' ', '|', ' ', ' ', '|', ' ', '|'],
        ['|', '_', '|', ' ', ' ', '|', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 8,
    maxTailOverlap: 8,
}

upperN : AsciiLetter
upperN = {
    rows: [
        [' ', '_', ' ', ' ', ' ', '_', ' '],
        ['|', ' ', '\\', ' ', '|', ' ', '|'],
        ['|', ' ', ' ', '\\', '|', ' ', '|'],
        ['|', ' ', '|', '\\', ' ', ' ', '|'],
        ['|', '_', '|', ' ', '\\', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperO : AsciiLetter
upperO = {
    rows: [
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperP : AsciiLetter
upperP = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', ' ', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', '_', ')', ' ', '|'],
        ['|', ' ', ' ', '_', '_', '/', ' '],
        ['|', '_', '|', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperQ : AsciiLetter
upperQ = {
    rows: [
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperR : AsciiLetter
upperR = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['|', ' ', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', '_', ')', ' ', '|'],
        ['|', ' ', ' ', '_', ' ', '<', ' '],
        ['|', '_', '|', ' ', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperS : AsciiLetter
upperS = {
    rows: [
        [' ', '_', '_', '_', '_', ' ', ' '],
        ['/', ' ', '_', '_', '_', '|', ' '],
        ['\\', '_', '_', '_', ' ', '\\', ' '],
        [' ', '_', '_', '_', ')', ' ', '|'],
        ['|', '_', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperT : AsciiLetter
upperT = {
    rows: [
        [' ', '_', '_', '_', '_', '_', ' '],
        ['|', '_', ' ', ' ', ' ', '_', '|'],
        [' ', ' ', '|', ' ', '|', ' ', ' '],
        [' ', ' ', '|', ' ', '|', ' ', ' '],
        [' ', ' ', '|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperU : AsciiLetter
upperU = {
    rows: [
        [' ', '_', ' ', ' ', ' ', '_', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperV : AsciiLetter
upperV = {
    rows: [
        ['_', '_', ' ', ' ', ' ', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', ' ', ' ', ' ', '/', ' ', '/'],
        [' ', '\\', ' ', '\\', ' ', '/', ' ', '/', ' '],
        [' ', ' ', '\\', ' ', 'V', ' ', '/', ' ', ' '],
        [' ', ' ', ' ', '\\', '_', '/', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 9,
    maxTailOverlap: 9,
}

upperW : AsciiLetter
upperW = {
    rows: [
        ['_', '_', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', ' ', ' ', ' ', ' ', ' ', ' ', '/', ' ', '/'],
        [' ', '\\', ' ', '\\', ' ', '/', '\\', ' ', '/', ' ', '/', ' '],
        [' ', ' ', '\\', ' ', 'V', ' ', ' ', 'V', ' ', '/', ' ', ' '],
        [' ', ' ', ' ', '\\', '_', '/', '\\', '_', '/', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 12,
    maxTailOverlap: 12,
}

upperX : AsciiLetter
upperX = {
    rows: [
        ['_', '_', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', '/', ' ', '/'],
        [' ', '\\', ' ', ' ', '/', ' '],
        [' ', '/', ' ', ' ', '\\', ' '],
        ['/', '_', '/', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
}

upperY : AsciiLetter
upperY = {
    rows: [
        ['_', '_', ' ', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', ' ', '/', ' ', '/'],
        [' ', '\\', ' ', 'V', ' ', '/', ' '],
        [' ', ' ', '|', ' ', '|', ' ', ' '],
        [' ', ' ', '|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperZ : AsciiLetter
upperZ = {
    rows: [
        [' ', '_', '_', '_', '_', '_'],
        ['|', '_', '_', ' ', ' ', '/'],
        [' ', ' ', '/', ' ', '/', ' '],
        [' ', '/', ' ', '/', '_', ' '],
        ['/', '_', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
}

lowerA : AsciiLetter
lowerA = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', '_', '_', ' ', '_', ' '],
        [' ', '/', ' ', '_', '`', ' ', '|'],
        ['|', ' ', '(', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerB : AsciiLetter
lowerB = {
    rows: [
        [' ', '_', ' ', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', '_', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '\\', ' '],
        ['|', ' ', '|', '_', ')', ' ', '|'],
        ['|', '_', '.', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerC : AsciiLetter
lowerC = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', '_', '_', '_', ' '],
        [' ', '/', ' ', '_', '_', '|'],
        ['|', ' ', '(', '_', '_', ' '],
        [' ', '\\', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
}

lowerD : AsciiLetter
lowerD = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', '_', ' '],
        [' ', ' ', '_', '_', '|', ' ', '|'],
        [' ', '/', ' ', '_', '`', ' ', '|'],
        ['|', ' ', '(', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerE : AsciiLetter
lowerE = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', '_', '_', '_', ' '],
        [' ', '/', ' ', '_', ' ', '\\'],
        ['|', ' ', ' ', '_', '_', '/'],
        [' ', '\\', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
}

lowerF : AsciiLetter
lowerF = {
    rows: [
        [' ', ' ', '_', '_', ' '],
        [' ', '/', ' ', '_', '|'],
        ['|', ' ', '|', '_', ' '],
        ['|', ' ', ' ', '_', '|'],
        ['|', '_', '|', ' ', ' '],
        [' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

lowerG : AsciiLetter
lowerG = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', '_', '_', ' ', '_', ' '],
        [' ', '/', ' ', '_', '`', ' ', '|'],
        ['|', ' ', '(', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', ' ', '|'],
        [' ', '|', '_', '_', '_', '/', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerH : AsciiLetter
lowerH = {
    rows: [
        [' ', '_', ' ', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', '_', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', '_', '|', ' ', '|', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerI : AsciiLetter
lowerI = {
    rows: [
        [' ', '_', ' '],
        ['(', '_', ')'],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', '_', '|'],
        [' ', ' ', ' '],
    ],
    maxHeadOverlap: 3,
    maxTailOverlap: 3,
}

lowerJ : AsciiLetter
lowerJ = {
    rows: [
        [' ', ' ', ' ', '_', ' '],
        [' ', ' ', '(', '_', ')'],
        [' ', ' ', '|', ' ', '|'],
        [' ', ' ', '|', ' ', '|'],
        [' ', '_', '/', ' ', '|'],
        ['|', '_', '_', '/', ' '],
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

lowerK : AsciiLetter
lowerK = {
    rows: [
        [' ', '_', ' ', ' ', ' ', ' '],
        ['|', ' ', '|', ' ', '_', '_'],
        ['|', ' ', '|', '/', ' ', '/'],
        ['|', ' ', ' ', ' ', '<', ' '],
        ['|', '_', '|', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' '],        
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
}

lowerL : AsciiLetter
lowerL = {
    rows: [
        [' ', '_', ' '],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', ' ', '|'],
        ['|', '_', '|'],
        [' ', ' ', ' '],        
    ],
    maxHeadOverlap: 3,
    maxTailOverlap: 3,
}

lowerM : AsciiLetter
lowerM = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', ' ', '_', '_', ' ', '_', '_', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '`', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', '_', '|', ' ', '|', '_', '|', ' ', '|', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],          
    ],
    maxHeadOverlap: 11,
    maxTailOverlap: 11,
}

lowerN : AsciiLetter
lowerN = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],  
        [' ', '_', ' ', '_', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '\\', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', '_', '|', ' ', '|', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],        
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerO : AsciiLetter
lowerO = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '], 
        [' ', ' ', '_', '_', '_', ' ', ' '],
        [' ', '/', ' ', '_', ' ', '\\', ' '],
        ['|', ' ', '(', '_', ')', ' ', '|'],
        [' ', '\\', '_', '_', '_', '/', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],        
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerP : AsciiLetter
lowerP = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', ' ', '_', '_', ' ', ' '],
        ['|', ' ', '\'', '_', ' ', '\\', ' '],
        ['|', ' ', '|', '_', ')', ' ', '|'],
        ['|', ' ', '.', '_', '_', '/', ' '],
        ['|', '_', '|', ' ', ' ', ' ', ' '],  
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerQ : AsciiLetter
lowerQ = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', '_', '_', ' ', '_', ' '],
        [' ', '/', ' ', '_', '`', ' ', '|'],
        ['|', ' ', '(', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', ' ', '|'],
        [' ', ' ', ' ', ' ', '|', '_', '|'],        
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerR : AsciiLetter
lowerR = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', '_', ' ', '_', '_', ' '],
        ['|', ' ', '\'', '_', '_', '|'],
        ['|', ' ', '|', ' ', ' ', ' '],
        ['|', '_', '|', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
}

lowerS : AsciiLetter
lowerS = {
    rows: [
        [' ', ' ', ' ', ' ', ' '],
        [' ', '_', '_', '_', ' '],
        ['/', ' ', '_', '_', '|'],
        ['\\', '_', '_', ' ', '\\'],
        ['|', '_', '_', '_', '/'],
        [' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

lowerT : AsciiLetter
lowerT = {
    rows: [
        [' ', '_', ' ', ' ', ' '],
        ['|', ' ', '|', '_', ' '],
        ['|', ' ', '_', '_', '|'],
        ['|', ' ', '|', '_', ' '],
        [' ', '\\', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' '],
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

lowerU : AsciiLetter
lowerU = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],  
        [' ', '_', ' ', ' ', ' ', '_', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', '_', '|'],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],        
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerV : AsciiLetter
lowerV = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '], 
        ['_', '_', ' ', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', ' ', '/', ' ', '/'],
        [' ', '\\', ' ', 'V', ' ', '/', ' '],
        [' ', ' ', '\\', '_', '/', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],   
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerW : AsciiLetter
lowerW = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
        ['_', '_', ' ', ' ', ' ', ' ', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', ' ', '/', '\\', ' ', '/', ' ', '/'],
        [' ', '\\', ' ', 'V', ' ', ' ', 'V', ' ', '/', ' '],
        [' ', ' ', '\\', '_', '/', '\\', '_', '/', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
    ],
    maxHeadOverlap: 10,
    maxTailOverlap: 10,
}

lowerX : AsciiLetter
lowerX = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' '],
        ['_', '_', ' ', ' ', '_', '_'],
        ['\\', ' ', '\\', '/', ' ', '/'],
        [' ', '>', ' ', ' ', '<', ' '],
        ['/', '_', '/', '\\', '_', '\\'],
        [' ', ' ', ' ', ' ', ' ', ' '],        
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
}

lowerY : AsciiLetter
lowerY = {
    rows: [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],  
        [' ', '_', ' ', ' ', ' ', '_', ' '],
        ['|', ' ', '|', ' ', '|', ' ', '|'],
        ['|', ' ', '|', '_', '|', ' ', '|'],
        [' ', '\\', '_', '_', ',', ' ', '|'],
        [' ', '|', '_', '_', '_', '/', ' '],       
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

lowerZ : AsciiLetter
lowerZ = {
    rows: [
        [' ', ' ', ' ', ' ', ' '],
        [' ', '_', '_', '_', '_'],
        ['|', '_', ' ', ' ', '/'],
        [' ', '/', ' ', '/', ' '],
        ['/', '_', '_', '_', '|'],
        [' ', ' ', ' ', ' ', ' '],        
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}
