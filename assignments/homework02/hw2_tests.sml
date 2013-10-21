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