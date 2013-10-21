(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* Problem 1 A *)

(* compares a list of strings *)
fun compare ([],[]) = true
	| compare ((x::xs),(y::ys)) = same_string(x,y) andalso compare(xs,ys)
	| compare (_,_) = false

fun all_except_option (str : string ,[]) = NONE
	| all_except_option (str : string,lst) = 
		let
		   fun nav ([],acc) =
			  if compare(acc,lst)
			  then NONE
			  else SOME acc
		     | nav ((h::t),acc) =
              if same_string(str,h)
			  then nav (t,acc)
			  else nav (t,acc @ [h])
 		 in
		   nav (lst,[])
		 end

(* Problem 1 B *)

fun get_substitutions1 ([], s) = []
		| get_substitutions1 (lst::lsts, s) =
			case all_except_option (s,lst) of
						NONE => get_substitutions1 (lsts,s)
					|	SOME xs => xs @ get_substitutions1 (lsts,s)

(* Problem 1 C *)

fun get_substitutions2 ([], s) = []
		| get_substitutions2 (lsts, s) =
			let
				fun nav ([], acc) = acc
				|	nav (hd::tl, acc) = 
					case all_except_option (s,hd) of
						NONE => nav(tl,acc)
					|	SOME xs => nav(tl, xs @ acc)
			in
				nav(lsts, [])
			end

(* Problem 1 D *)

fun similar_names ([] : string list list, r : {first: string, middle: string, last: string}) = [r]
	| similar_names (lsts, {first,middle,last} : {first:string, middle:string, last:string}) =
			let
				val subs = get_substitutions1 (lsts,first)
				fun substitute ([],acc) = acc
					| substitute (name::tl, acc) = substitute (tl,acc @ [{first=name,middle=middle,last=last}])
			in
				substitute (subs,[{first=first,middle=middle,last=last}])
			end		


(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
