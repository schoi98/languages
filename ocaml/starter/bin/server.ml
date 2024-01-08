open Lwt.Infix

let run_server() =
  Lwt.return ()

let () = 
  let _ = Lwt_main.run (run_server ())