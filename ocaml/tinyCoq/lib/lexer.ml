type token = 
| Lambda
| Dot 
| LParen
| RParen
| Symbol of string


exception LexingError of string

let is_alpha c = 
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

let is_digit c = 
  '0' <= c && c <= '9'

let is_alnum c = 
  is_alpha c || is_digit c

let rec tokenize input pos tokens =
  if pos >= String.length input then
    List.rev tokens
  else
    match input.[pos] with
    | ' ' | '\t' | '\n' -> tokenize input (pos + 1) tokens  (* Skip whitespace *)
    | '\\' -> tokenize input (pos + 1) (Lambda :: tokens)
    | '.' -> tokenize input (pos + 1) (Dot :: tokens)
    | '(' -> tokenize input (pos + 1) (LParen :: tokens)
    | ')' -> tokenize input (pos + 1) (RParen :: tokens)
    | c when is_alpha c ->
        let rec consume_var start_pos end_pos =
          if end_pos < String.length input && is_alnum input.[end_pos] then
            consume_var start_pos (end_pos + 1)
          else
            let var = String.sub input start_pos (end_pos - start_pos) in
            (var, end_pos)
        in
        let (var, next_pos) = consume_var pos (pos + 1) in
        tokenize input next_pos (Symbol var :: tokens)
    | c -> raise (LexingError (Printf.sprintf "Unexpected character: %c" c))

let lexer input =
  tokenize input 0 []
