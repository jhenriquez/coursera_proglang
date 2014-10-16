(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* Problem 01 A *)

fun all_except_option (str ,[]) = NONE
	| all_except_option (str,lst) =
		let 
			fun nav ([],acc) =
				if acc = lst
			 	then NONE
			  	else SOME acc
		    | nav ((h::t),acc) =
              	if same_string(str,h)
				then nav (t,acc)
			  	else nav (t,acc @ [h])
 		 	in
		   		nav (lst,[])
		 	end

(* Problem 01 B *)

fun get_substitutions1 ([], s) = []
		| get_substitutions1 (lst::lsts, s) =
			case all_except_option (s,lst) of
						NONE => get_substitutions1 (lsts,s)
					|	SOME xs => xs @ get_substitutions1 (lsts,s)

(* Problem 01 C *)

fun get_substitutions2 ([], s) = []
		| get_substitutions2 (lsts, s) =
			let
				fun nav ([], acc) = acc
				|	nav (hd::tl, acc) = 
					case all_except_option (s,hd) of
						NONE => nav(tl,acc)
					|	SOME xs => nav(tl, acc @ xs)
			in
				nav(lsts, [])
			end

(* Problem 01 D *)

fun similar_names ([], r : {first: string, middle: string, last: string}) = [r]
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

(* Problem 02 A *)

fun card_color (Clubs,_) = Black
	| card_color (Spades,_) = Black
	| card_color (Diamonds,_) = Red
	| card_color (Hearts,_) = Red

(* Problem 02 B *)

fun card_value (_,Num va) = va
	| card_value (_, Ace) = 11
	| card_value (_,_) = 10

(* Problem 02 C *)

fun remove_card ([],_,ex) = raise ex
	| remove_card (cs,c,ex) = 
		let
			fun remover ([],acc) =
				if cs = acc
				then raise ex
				else acc
			| remover (hd::tl,acc) =
				if (hd = c)
				then tl @ acc
				else remover (tl, (acc @ [hd]))
		in
			remover (cs,[])
		end

(* Problem 02 D *)

fun all_same_color [] = true
	| all_same_color (_::[]) = true
	| all_same_color (first::second::[]) = 
		card_color (first) = card_color (second)
	| all_same_color (first::second::third::tail) = 
		card_color (first) = card_color (second)
		andalso card_color (first) = card_color (third)
		andalso all_same_color (tail)

(* Problem 02 E *)

fun sum_cards [] = 0
	| sum_cards cards =
		let
			fun summarize ([],acc) = acc
				| summarize (card::tail,acc) = summarize(tail,acc+card_value(card))
		in
			summarize(cards,0)
		end

(* Problem 02 F *)

fun score (cards,goal) =
		let
			val sum = sum_cards (cards)
			val preliminary = if sum > goal
							  then 3 * (sum - goal)
							  else (goal - sum)
		in
			if (all_same_color(cards))
			then (preliminary div 2)
			else preliminary
		end

(* Problem 02 G *)

fun officiate (cards, moves, goal) =
	let
		fun play ([],  _, hand) = score(hand, goal)
			| play (_, [], hand) = score (hand, goal)
			| play (move::remaining_moves, next_card::deck, hand) =
				if sum_cards hand > goal
				then score (hand, goal)
				else case move of
					Draw => play (remaining_moves, deck, hand @ [next_card])
				|	Discard card => play (remaining_moves, [next_card] @ deck, remove_card (hand, card, IllegalMove))
	in
		play (moves, cards, [])
	end

(* Problem 03 A *)

(*
Write score_challenge and officiate_challenge to be like their non-challenge counterparts except
each ace can have a value of 1 or 11 and score_challenge should always return the least (i.e., best)
possible score. (Note the game-ends-if-sum-exceeds-goal rule should apply only if there is no sum less
than or equal to the goal.) Hint: This is easier than you might think
*)

(* Problem 03 B *)

(*
Write careful_player, which takes a card-list and a goal and returns a move-list such that calling
officiate with the card-list, the goal, and the move-list has this behavior:

	• The value of the held cards never exceeds the goal.
	• A card is drawn whenever the goal is more than 10 greater than the value of the held cards. As a
	detail, you should (attempt to) draw, even if no cards remain in the card-list.
	• If a score of 0 is reached, there must be no more moves.
	• If it is possible to discard one card, then draw one card to produce a score of 0, then this must be
	done. Note careful_player will have to look ahead to the next card, which in many card games
	is considered “cheating.” Also note that the previous requirement takes precedence: There must
	be no more moves after a score of 0 is reached even if there is another way to get back to 0.
*)