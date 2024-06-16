open Lexer

type expr =
  | Var of string
  | Abs of string * expr
  | App of expr * expr

let rec string_of_expr e =
  match e with
  | Var x -> x
  | Abs (x, e) -> "\\" ^ x ^ "." ^ string_of_expr e
  | App (e1, e2) -> "(" ^ string_of_expr e1 ^ " " ^ string_of_expr e2 ^ ")"

let parse tokens =
  let rec parse_expr tokens =
    let parse_atom tokens =
      match tokens with
      | LParen :: rest ->
        let (e, rest) = parse_expr rest in
        (match rest with
         | RParen :: rest -> (e, rest)
         | _ -> failwith "Expected closing parenthesis")
      | Symbol x :: rest -> (Var x, rest)
      | _ -> failwith "parse_atom"
    in
    let parse_abs tokens =
      match tokens with
      | Lambda :: Symbol x :: Dot :: rest ->
        let (e, rest) = parse_expr rest in
        (Abs (x, e), rest)
      | _ -> failwith "parse_abs"
    in
    let rec parse_apps tokens =
      let (e1, rest) = parse_atom tokens in
      match rest with
      | [] -> (e1, [])
      | _ ->
        let (e2, rest) = parse_apps rest in
        (App (e1, e2), rest)
    in
    match tokens with
    | Lambda :: _ -> parse_abs tokens
    | _ -> parse_apps tokens
  in
  let (expr, remaining_tokens) = parse_expr tokens in
    match remaining_tokens with
    | [] -> expr
    | _ -> failwith "Unexpected tokens"