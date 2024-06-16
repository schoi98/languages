open TinyCoq

let () =
  let test_input = "\\x. (x y)" in
  let result =
    test_input
    |> Lexer.lexer
    |> Parser.parse
    |> Eval.eval_expr
  in
  let result_str = Parser.string_of_expr result in
  print_endline result_str