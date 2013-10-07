(* Programming Languages Course - Homework Assigment No. 1 *)


(* 
Problem 01 - Write a function that recieves two parameters of the same type (a date represented as int * int * int),
and determines if the first date comes first than the second. 
*)

fun is_older(d1 : int * int * int, d2 : int * int * int) =
	if (#1 d1 < #1 d2) (* Year *)
	orelse (#2 d1 < #2 d2) (* Month *)
	orelse ((#3 d1 < #3 d2) andalso (#2 d1 >= #2 d2)) (* Day and month should be smaller *)
	then true
	else false
