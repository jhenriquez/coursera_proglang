(* Programming Languages Course - Homework Assigment No. 1 *)


(* 
Problem 01
Write a function is_older that takes two dates and evaluates to true or false. It evaluates to true if
the first argument is a date that comes before the second argument. (If the two dates are the same,
the result is false.)

This solution evaluates the date by parts on the order they were set on tuple: #1 => Year, #2 => Month, #3 => Day.
Also, it assumes that if a smaller digit is found during the comparison of dates, it should evaluate no further.
*)

fun is_older(d1 : int * int * int, d2 : int * int * int) =
	if (#1 d1 < #1 d2) (* Year *)
	orelse (#2 d1 < #2 d2) (* Month *)
	then true
	else (#3 d1 < #3 d2) andalso not (#2 d1 > #2 d2) (* Day *)


(*
Problem 02

Write a function number_in_month that takes a list of dates and a month (i.e., an int) and returns
how many dates in the list are in the given month.
*)

fun number_in_month (dates : (int*int*int) list, month : int) =
	if null dates
	then 0
	else 
		if (#2 (hd dates)) <> month
		then 0
		else 1 + number_in_month (tl(dates), month)

(*
Problem 03

Write a function number_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns the number of dates in the list of dates that are in any of the months in the list of months.
Assume the list of months has no number repeated. Hint: Use your answer to the previous problem.
*)

fun number_in_months (dates : (int*int*int) list, months : int list) =
	if null months
	then 0
	else number_in_month (dates, (hd months)) + number_in_months (dates, (tl months))