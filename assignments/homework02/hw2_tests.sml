(* Problem 01 - A *)

val all_except_option_no_option = all_except_option ("polo",["no", "option"]) = NONE
val all_except_option_exists_one_element_list = all_except_option ("string",["string"]) = SOME []
val all_except_option_option_in_middle = all_except_option ("2",["1","2","3","4"]) = SOME ["1","3","4"]
val all_except_option_empty_list = all_except_option ("1",[]) = NONE
val all_except_option_at_start = all_except_option ("1",["1","2","3"]) = SOME ["2","3"]
val all_except_option_at_end = all_except_option ("4",["1","2","3","4"]) = SOME ["1","2","3"]

(* Problem 01 - B *)

val get_substitutions1_test1 = get_substitutions1([["foo"],["there"]], "foo") = []
val get_substitutions1_test2 = get_substitutions1([["foo","bar"],["there"]], "foo") = ["bar"]
val get_substitutions1_test3 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]

(* Problem 01 - C *)

val get_substitutions2_test1 = get_substitutions2([["foo"],["there"]], "foo") = []
val get_substitutions2_test2 = get_substitutions2([["foo","bar"],["there"]], "foo") = ["bar"]
val get_substitutions2_test3 = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]

(* Problem 01 D *)

val similar_names_test1 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) = [{first="Fred", last="Smith", middle="W"},
																																						 {first="Fredrick", last="Smith", middle="W"},
	     																																				 {first="Freddie", last="Smith", middle="W"},
	     																																				 {first="F", last="Smith", middle="W"}]

val similar_names_test2 = similar_names([["Julio","Polo"],["Elizabeth","Betty"],["Polito","Julio","Polin"]], {first="Julio", middle="M", last="Henriquez"}) = [{first="Julio", last="Henriquez", middle="M"},
																																						 {first="Polo", last="Henriquez", middle="M"},
	     																																				 {first="Polito", last="Henriquez", middle="M"},
	     																																				 {first="Polin", last="Henriquez", middle="M"}]

val similar_names_test3 = similar_names([["Julio","Polo"],["Elizabeth","Betty"],["Polito","Julio","Polin"]], {first="Batida", middle="M", last="Henriquez"}) = [{first="Batida", last="Henriquez", middle="M"}]

(* Problem 02 A *)

val card_color_test1 = card_color((Clubs, Num 2)) = Black
val card_color_test2 = card_color((Hearts, Num 2)) = Red

(* Problem 02 B *)

val card_value_test1 = card_value((Clubs, Num 2)) = 2
val card_value_test2 = card_value((Clubs, Ace)) = 11
val card_value_test3 = card_value((Clubs, Jack)) = 10
val card_value_test4 = card_value((Clubs, Queen)) = 10
val card_value_test5 = card_value((Clubs, King)) = 10

(* Problem 02 C *)

val remove_card_test1 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val remove_card_test2 = remove_card([(Hearts, Ace),(Hearts, Ace)], (Hearts, Ace), IllegalMove) = [(Hearts, Ace)]
val remove_card_test3 = remove_card([(Hearts, Ace),(Hearts, Ace), (Clubs,Num 2)], (Hearts, Ace), IllegalMove) = [(Hearts, Ace),(Clubs,Num 2)]

(* Problem 02 D *)

val all_same_color_black = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true
val all_same_color_red = all_same_color([(Diamonds, Ace), (Diamonds, Ace)]) = true
val all_same_color_red_and_black = all_same_color([(Clubs, Ace), (Hearts, Ace)]) = false
val all_same_color_black_red_black = all_same_color([(Clubs, Ace), (Hearts, Ace),(Diamonds, Ace)]) = false
val all_same_color_black_black_red = all_same_color([(Clubs, Ace), (Clubs, Ace),(Hearts, Ace)]) = false
val all_same_color_five_one_different = all_same_color([(Clubs, Ace), (Clubs, Ace),(Hearts, Ace),(Clubs, Ace), (Clubs, Ace)]) = false
val all_same_color_seven_equal_cards = all_same_color([(Clubs, Ace), (Clubs, Ace),(Clubs, Ace),(Clubs, Ace), (Clubs, Ace),(Clubs, Ace), (Clubs, Ace)]) = true

(* Problem 02 E *)

val sum_cards_test1 = sum_cards([(Clubs, Num 2),(Clubs, Num 2)]) = 4
val sum_cards_test2 = sum_cards([(Clubs, Num 2),(Clubs, Ace)]) = 13
val sum_cards_test3 = sum_cards([(Clubs, Num 3),(Clubs, King)]) = 13
val sum_cards_test4 = sum_cards([(Clubs, Num 3),(Clubs, Queen)]) = 13
val sum_cards_test5 = sum_cards([(Clubs, Num 3),(Clubs, Jack)]) = 13