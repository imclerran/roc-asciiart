app [main] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.10.0/vNe6s9hWzoTZtFmNkvEICPErI9ptji_ySjicO6CkucY.tar.br",
    art: "../package/main.roc"
}

import cli.Stdout
import cli.Stdin
import cli.Task exposing [Task]
import art.Art

main : Task {} _
main =
    Stdout.line! ("ASCII-echo" |> Art.strToArtTrimmed)
    Task.forever loop

loop =
    Stdout.write! "Enter some text: "
    input = Stdin.line! 
    Stdout.line! (input |> Art.strToArt)
