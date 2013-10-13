(*
Assert function to make test run outputs more readable.
	*)

fun assert (expression : bool, description : string) : string =
	let
	  val status = if expression then "Win!" else "Fail!"
	  val out = "Status: "
	in
	  out^status^", "^description
	end