(* Programming Languages Course - Homework Assigment No. 1 *)


(* 
Problem 01
Write a function is_older that takes two dates and evaluates to true or false. It evaluates to true if
the first argument is a date that comes before the second argument. (If the two dates are the same,
the result is false.)

This solution evaluates the date by parts on the order they were set on tuple: #1 => Year, #2 => Month, #3 => Day.
Also, it assumes that if a smaller digit is found during the comparison of dates, it should evaluate no further.
*)

fun is_older(d1 : int * int * int, d2 : int * int * int) : bool =
	if (#1 d1 < #1 d2)
	orelse (#2 d1 < #2 d2)
	then true
	else (#3 d1 < #3 d2) andalso not (#2 d1 > #2 d2)


(*
Problem 02

Write a function number_in_month that takes a list of dates and a month (i.e., an int) and returns
how many dates in the list are in the given month.
*)

fun number_in_month (dates : (int*int*int) list, month : int) : int =
	if null dates
	then 0
	else if not ((#2 (hd dates)) = month)
	then 0 + number_in_month (tl(dates), month)
	else 1 + number_in_month (tl(dates), month)

(*
Problem 03

Write a function number_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns the number of dates in the list of dates that are in any of the months in the list of months.
Assume the list of months has no number repeated. Hint: Use your answer to the previous problem.
*)

fun number_in_months (dates : (int*int*int) list, months : int list) : int =
	if null months
	then 0
	else number_in_month (dates, hd(months)) + number_in_months (dates, tl(months))


(*
Problem 04

Write a function dates_in_month that takes a list of dates and a month (i.e., an int) and returns a
list holding the dates from the argument list of dates that are in the month. The returned list should
contain dates in the order they were originally given.
*)

fun dates_in_month (dates : (int*int*int) list, month : int) : (int*int*int) list  =
	if null dates
	then []
	else if not ((#2 (hd dates)) = month)
	then dates_in_month (tl(dates), month)
	else (hd dates)::dates_in_month (tl(dates), month)

(*
Problem 05

Write a function dates_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns a list holding the dates from the argument list of dates that are in any of the months in
the list of months.

This function assumes the list of months has no number repeated.
*)

fun dates_in_months (dates : (int*int*int) list, months : int list)  = (* What's the syntax for the output? *)
	if null months
	then []
	else dates_in_month(dates, hd(months))@dates_in_months (dates, tl(months))

(*
Problem 06

Write a function get_nth that takes a list of strings and an int n and returns the nth element of the list
where the head of the list is 1st.
*)

fun get_nth (strings : string list, index : int) : string =
	if null (strings)
	then ""
	else if index = 1
	then hd (strings)
	else get_nth (tl(strings), index - 1)

(* Problem 7 *)

fun date_to_string (date : int * int * int) =
	let
	  val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	  val month = get_nth (months, (#2 date))^" "
	  val day = Int.toString (#3 date)^", "
	  val year = Int.toString((#1 date))
	in
	  month^day^year
	end
