module [
    AsciiLetter, 
    charToAsciiLetter,
    emptyLetter,
    space,
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
]

charToAsciiLetter : U8 -> AsciiLetter
charToAsciiLetter = \char -> Dict.get letterDict char |> Result.withDefault emptyLetter


letterDict = Dict.empty {}
    |> Dict.insert ' ' space
    |> Dict.insert '.' fullStop
    |> Dict.insert ',' comma
    |> Dict.insert ':' colon
    |> Dict.insert ';' semiColon
    |> Dict.insert '!' exclamationMark
    |> Dict.insert '"' quotationMark
    |> Dict.insert '/' forwardSlash
    |> Dict.insert '\\' backSlash
    |> Dict.insert '(' roundOpenBracket
    |> Dict.insert ')' roundCloseBracket
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
    maxHeadOverlap: 3,
    maxTailOverlap: 3,
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
    maxHeadOverlap: 3,
    maxTailOverlap: 3,
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
    maxHeadOverlap: 3,
    maxTailOverlap: 3,
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

upperA : AsciiLetter
upperA = {
    rows: [
        [32, 32, 32, 32, 95, 32, 32, 32, 32],
        [32, 32, 32, 47, 32, 92, 32, 32, 32],
        [32, 32, 47, 32, 95, 32, 92, 32, 32],
        [32, 47, 32, 95, 95, 95, 32, 92, 32],
        [47, 95, 47, 32, 32, 32, 92, 95, 92],
        [32, 32, 32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 9,
    maxTailOverlap: 9,
}

upperB : AsciiLetter
upperB = {
    rows: [
        [32, 95, 95, 95, 95, 32, 32],
        [124, 32, 95, 95, 32, 41, 32],
        [124, 32, 32, 95, 32, 92, 32],
        [124, 32, 124, 95, 41, 32, 124],
        [124, 95, 95, 95, 95, 47, 32],
        [32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperC : AsciiLetter
upperC = {
    rows: [
        [32, 32, 95, 95, 95, 95, 32],
        [32, 47, 32, 95, 95, 95, 124],
        [124, 32, 124, 32, 32, 32, 32],
        [124, 32, 124, 95, 95, 95, 32],
        [32, 92, 95, 95, 95, 95, 124],
        [32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperD : AsciiLetter
upperD = {
    rows: [
        [32, 95, 95, 95, 95, 32, 32],
        [124, 32, 32, 95, 32, 92, 32],
        [124, 32, 124, 32, 124, 32, 124],
        [124, 32, 124, 95, 124, 32, 124],
        [124, 95, 95, 95, 95, 47, 32],
        [32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperE : AsciiLetter
upperE = {
    rows: [
        [32, 95, 95, 95, 95, 95, 32],
        [124, 32, 95, 95, 95, 95, 124],
        [124, 32, 32, 95, 124, 32, 32],
        [124, 32, 124, 95, 95, 95, 32],
        [124, 95, 95, 95, 95, 95, 124],
        [32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperF : AsciiLetter
upperF = {
    rows: [
        [32, 95, 95, 95, 95, 95, 32],
        [124, 32, 95, 95, 95, 95, 124],
        [124, 32, 124, 95, 32, 32, 32],
        [124, 32, 32, 95, 124, 32, 32],
        [124, 95, 124, 32, 32, 32, 32],
        [32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperG : AsciiLetter
upperG = {
    rows: [
        [32, 32, 95, 95, 95, 95, 32],
        [32, 47, 32, 95, 95, 95, 124],
        [124, 32, 124, 32, 32, 95, 32],
        [124, 32, 124, 95, 124, 32, 124],
        [32, 92, 95, 95, 95, 95, 124],
        [32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperH : AsciiLetter
upperH = {
    rows: [
        [32, 95, 32, 32, 32, 95, 32],
        [124, 32, 124, 32, 124, 32, 124],
        [124, 32, 124, 95, 124, 32, 124],
        [124, 32, 32, 95, 32, 32, 124],
        [124, 95, 124, 32, 124, 95, 124],
        [32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperI : AsciiLetter
upperI = {
    rows: [
        [32, 95, 95, 95, 32],
        [124, 95, 32, 95, 124],
        [32, 124, 32, 124, 32],
        [32, 124, 32, 124, 32],
        [124, 95, 95, 95, 124],
        [32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

upperJ : AsciiLetter
upperJ = {
    rows: [
        [32, 32, 32, 32, 32, 95, 32],
        [32, 32, 32, 32, 124, 32, 124],
        [32, 95, 32, 32, 124, 32, 124],
        [124, 32, 124, 95, 124, 32, 124],
        [32, 92, 95, 95, 95, 47, 32],
        [32, 32, 32, 32, 32, 32, 32],

    ],
    maxHeadOverlap: 5,
    maxTailOverlap: 5,
}

upperK : AsciiLetter
upperK = {
    rows: [
        [32, 95, 32, 32, 95, 95],
        [124, 32, 124, 47, 32, 47],
        [124, 32, 39, 32, 47, 32],
        [124, 32, 46, 32, 92, 32],
        [124, 95, 124, 92, 95, 92],
        [32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 6,
    maxTailOverlap: 6,
}

upperL : AsciiLetter
upperL = {
    rows: [
        [32, 95, 32, 32, 32, 32, 32],
        [124, 32, 124, 32, 32, 32, 32],
        [124, 32, 124, 32, 32, 32, 32],
        [124, 32, 124, 95, 95, 95, 32],
        [124, 95, 95, 95, 95, 95, 124],
        [32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperM : AsciiLetter
upperM = {
    rows: [
        [32, 95, 95, 32, 32, 95, 95, 32],
        [124, 32, 32, 92, 47, 32, 32, 124],
        [124, 32, 124, 92, 47, 124, 32, 124],
        [124, 32, 124, 32, 32, 124, 32, 124],
        [124, 95, 124, 32, 32, 124, 95, 124],
        [32, 32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 8,
    maxTailOverlap: 8,
}

upperN : AsciiLetter
upperN = {
    rows: [
        [32, 95, 32, 32, 32, 95, 32],
        [124, 32, 92, 32, 124, 32, 124],
        [124, 32, 32, 92, 124, 32, 124],
        [124, 32, 124, 92, 32, 32, 124],
        [124, 95, 124, 32, 92, 95, 124],
        [32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperO : AsciiLetter
upperO = {
    rows: [
        [32, 32, 95, 95, 95, 32, 32],
        [32, 47, 32, 95, 32, 92, 32],
        [124, 32, 124, 32, 124, 32, 124],
        [124, 32, 124, 95, 124, 32, 124],
        [32, 92, 95, 95, 95, 47, 32],
        [32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperP : AsciiLetter
upperP = {
    rows: [
        [32, 95, 95, 95, 95, 32, 32],
        [124, 32, 32, 95, 32, 92, 32],
        [124, 32, 124, 95, 41, 32, 124],
        [124, 32, 32, 95, 95, 47, 32],
        [124, 95, 124, 32, 32, 32, 32],
        [32, 32, 32, 32, 32, 32, 32],
    ],
    maxHeadOverlap: 7,
    maxTailOverlap: 7,
}

upperQ : AsciiLetter
upperQ = {
    rows: [
        [32, 32, 95, 95, 95, 32, 32],
        [32, 47, 32, 95, 32, 92, 32],
        [124, 32, 124, 32, 124, 32, 124],
        [124, 32, 124, 95, 124, 32, 124],
        [32, 92, 95, 95, 92, 95, 92],
        [32, 32, 32, 32, 32, 32, 32],
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
        [95, 95, 32, 32, 32, 32, 32, 95, 95],
        [92, 32, 92, 32, 32, 32, 47, 32, 47],
        [32, 92, 32, 92, 32, 47, 32, 47, 32],
        [32, 32, 92, 32, 86, 32, 47, 32, 32],
        [32, 32, 32, 92, 95, 47, 32, 32, 32],
        [32, 32, 32, 32, 32, 32, 32, 32, 32],
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
