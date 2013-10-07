(* Programming Languages Course - Homework Assigment No. 1 *)


(* 
Problem 01 - Write a function that recieves two parameters of the same type (a date represented as int * int * int),
and determines if the first date comes first than the second.

This solution evaluates the date by parts on the order they were set on tuple: #1 => Year, #2 => Month, #3 => Day.
Also, it assumes that if a smaller digit is found during the comparison of dates, it should evaluate no further.
*)

fun is_older(d1 : int * int * int, d2 : int * int * int) =
	if (#1 d1 < #1 d2) (* Year *)
	orelse (#2 d1 < #2 d2) (* Month *)
	then true
	else (#3 d1 < #3 d2) andalso not (#2 d1 > #2 d2) (* Day *)
