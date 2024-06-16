open TinyCoq

let () =
  let test_input = "\\x. (x y)" in
  let tokens = TinyCoq.Lexer.lexer test_input in
  List.iter (function
    | Lambda -> print_endline "Lambda"
    | Dot -> print_endline "Dot"
    | LParen -> print_endline "LParen"
    | RParen -> print_endline "RParen"
    | Symbol v -> Printf.printf "Symbol %s\n" v
  ) tokens
