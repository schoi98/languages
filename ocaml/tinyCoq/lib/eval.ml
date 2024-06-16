open Parser

type env = (string * expr) list

let rec eval (e : expr) (env : env) : expr =
  match e with
  | Var x ->
    (match List.assoc_opt x env with
     | Some v -> v
     | None -> failwith ("Unbound variable: " ^ x))
  | Abs (x, e) -> Abs (x, e)
  | App (e1, e2) ->
    let v1 = eval e1 env in
    let v2 = eval e2 env in
    match v1 with
    | Abs (x, e) ->
      let new_env = (x, v2) :: env in
      eval e new_env
    | _ -> failwith "Application of non-function"

let eval_expr (e : expr) : expr =
  eval e []