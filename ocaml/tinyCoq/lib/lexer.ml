
type token = 
| Lambda
| Dot 
| LParen
| RParen
| Symbol of string

exception LexingError of string

let is_alpha c = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')
let is_alnum c = is_alpha c || (c >= '0' && c <= '9')

let rec tokenize input pos tokens =
  if pos >= String.length input then
    List.rev tokens
  else
    match input.[pos] with
    | ' ' | '\t' | '\n' -> tokenize input (pos + 1) tokens
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
    | c -> raise (LexingError (Printf.sprintf "Unexpected character: %c at position: %d" c pos))

let lexer input =
  tokenize input 0 []
