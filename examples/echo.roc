app [main!] {
    # cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.10.0/vNe6s9hWzoTZtFmNkvEICPErI9ptji_ySjicO6CkucY.tar.br",
    cli: platform "../../basic-cli/platform/main.roc",
    art: "../package/main.roc",
}

import cli.Stdout
import cli.Stdin
import art.Art

main! = \_ ->
    Stdout.line!("ASCII-echo" |> Art.str_to_art_trimmed)?
    loop!({})?
    Ok {}

loop! : {} => Result {} _
loop! = \{} ->
    Stdout.write!("Enter some text: ")?
    input = Stdin.line!({})?
    Stdout.line!(input |> Art.str_to_art)?
    loop!({})
