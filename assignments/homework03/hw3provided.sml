(* Coursera Programming Languages, Homework 3, Provided Code *)
exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

(*

Problem 01 - only_capitals

Write a function only_capitals that takes a string list and returns a string list that has only
the strings in the argument that start with an uppercase letter. Assume all strings have at least 1
character. Use List.filter, Char.isUpper, and String.sub to make a 1-2 line solution.

*)

fun only_capitals xs =
		List.filter (fn x => Char.isUpper(String.sub(x,0))) xs

(*

Problem 02 - longest_string1 


*)

fun longest_string1 lst = 
		foldl (fn (x,y) => if String.size x > String.size y then x else y) "" lst

(*

Problem 03 - longest_string2 


*)

fun longest_string2 lst = 
		foldr (fn (x,y) => if String.size x > String.size y then x else y) "" lst


(*

Problem 04 - longest_string_helper, longest_string3, longest_string4


*)

fun longest_string_helper f =
		foldr (fn (x,y) => if f(String.size x, String.size y) then x else y) ""

val longest_string3 = longest_string_helper (fn (x,y) => x >= y)
val longest_string4 = longest_string_helper (fn (x,y) => x > y)

(*

Problem 05 - longest_capitalized

Write a function longest_capitalized that takes a string list and returns the longest string in
the list that begins with an uppercase letter, or "" if there are no such strings. Assume all strings
have at least 1 character. Use a val-binding and the ML library's o operator for composing functions.
Resolve ties like in problem 2.

*)


val longest_capitalized = (longest_string1 o only_capitals)


(*

Problem 06 - rev_string

Write a function rev_string that takes a string and returns the string that is the same characters in
reverse order. Use ML's o operator, the library function rev for reversing lists, and two library functions
in the String module. (Browse the module documentation to find the most useful functions.)

*)

fun rev_string s = (String.implode o rev o String.explode) s

(*

Problem 07 - first_answer

Write a function first_answer of type ('a -> 'b option) -> ('a list -> 'b) (notice the 2 arguments are curried).
The first argument should be applied to elements of the second argument in order until the first time it returns
SOME v for some v and then v is the result of the call to first_answer.

If the first argument returns NONE for all list elements, then first_answer should raise the exception NoAnswer.

*)

fun first_answer _ [] = raise NoAnswer
	|	first_answer f elements =
			case (List.filter (fn e => case (f e) of NONE => false | SOME _ => true) elements) of
					[] => raise NoAnswer
					| e::_ => e

(*

Problem 08 - all_answers

Write a function all_answers of type ('a -> 'b list option) -> 'a list -> 'b list option
(notice the 2 arguments are curried). The first argument should be applied to elements of the second
argument. If it returns NONE for any element, then the result for all_answers is NONE. Else the
calls to the first argument will have produced SOME lst1, SOME lst2, ... SOME lstn and the result of
all_answers is SOME lst where lst is lst1, lst2, ..., lstn appended together (order doesn't matter).
Hints: The sample solution is 8 lines. It uses a helper function with an accumulator and uses @. Note
all_answers f [] should evaluate to SOME [].

*)

fun all_answers f [] = SOME []
	| all_answers f elements =
		let
			fun select ([],acc) = SOME acc
				| select (item::items',acc) =
					case (f item) of NONE => NONE | SOME value => select (items', value @ acc)
		in select (elements, []) end


(*

Problem 09 A - count_wildcards

*)

fun count_wildcards p =
		case p of
			Wildcard => g (fn _ => 1) (fn _=> 0) p
			| TupleP _ => g (fn _ => 1) (fn _=> 0) p
			| ConstructorP (_,p) => g (fn _ => 1) (fn _=> 0) p
			| _ => 0

(*

Problem 09 B - count_wild_and_variable_lengths

*)

fun count_wild_and_variable_lengths p =
		case p of
			Wildcard => g (fn _ => 1) (fn _ => 0) p
			| Variable x => g (fn _ => 0) (fn x => String.size x) p
			| TupleP _ => g (fn _ => 1) (fn x => String.size x) p
			| ConstructorP (_,p) => g (fn x => 1) (fn x => String.size x) p