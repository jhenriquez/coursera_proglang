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


*)


val longest_capitalized = (longest_string1 o only_capitals)


(*

Problem 06 - rev_string


*)

fun rev_string s = (String.implode o rev o String.explode) s

(*

Problem 07 - first_answer


*)

fun first_answer _ [] = raise NoAnswer
	|	first_answer f elements =
			case (List.filter (fn e => case (f e) of NONE => false | SOME _ => true) elements) of
					[] => raise NoAnswer
					| e::_ => e

(*

Problem 08 - all_answers


*)

fun all_answers f [] = SOME []
	| all_answers f elements =
		let
			fun select ([],acc) = SOME acc
				| select (item::items',acc) =
					case (f item) of NONE => NONE | SOME value => select (items', value @ acc)
		in
			select (elements, [])
		end