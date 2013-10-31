(* Problem 01 - only_capitals *)

val only_capitals_test_list_of_UpperChars = only_capitals ["A","B","C"] = ["A","B","C"]
val only_capitals_none_capitalized = only_capitals ["pablo","batida","vive"] = []
val only_capitals_empty_list_should_return_emtpy_list = only_capitals [] = []

(* Problem 02 - longest_string1 *)

val longest_string1_A_bc_D_returns_bc = longest_string1 ["A","bc","D"] = "bc"
val longest_string1_A_bc_D_ef_returns_bc = longest_string1 ["A","bc","D", "ef"] = "bc"
val longest_string1_tide_returns_left = longest_string1 ["A","bc","D", "pablo", "batid"] = "pablo"
val longest_string1_empty_list = longest_string1 [] = ""
val test4b_longest_string1 = longest_string1 ["A","B","C"] = "A"

(* Problem 03 - longest_string2 *)

val longest_string2_A_bc_D_returns_bc = longest_string2 ["A","bc","D"] = "bc"
val longest_string2_A_bc_D_ef_returns_ef = longest_string2 ["A","bc","D", "ef"] = "ef"
val longest_string2_tide_returns_left = longest_string2 ["A","bc","D", "pablo", "batid"] = "batid"
val longest_string2_empty_list = longest_string2 [] = ""
val test4b_longest_string2 = longest_string2 ["A","B","C"] = "C"

(* Problem 04 - longest_string3 *)

val longest_string3_A_bc_D_returns_bc = longest_string3 ["A","bc","D"] = "bc"
val longest_string3_A_bc_D_ef_returns_bc = longest_string3 ["A","bc","D", "ef"] = "bc"
val longest_string3_empty_list = longest_string3 [] = ""
val longest_string3_returns_first_when_single_char = longest_string3 ["A","B","C"] = "A"

(* Problem 04 - longest_string4 *)

val longest_string4_A_bc_D_returns_bc = longest_string4 ["A","bc","D"] = "bc"
val longest_string4_A_bc_D_ef_returns_ef = longest_string4 ["A","bc","D", "ef"] = "ef"
val longest_string4_tide_returns_right = longest_string4 ["A","bc","D", "pablo", "batid"] = "batid"
val longest_string4_empty_list = longest_string4 [] = ""
val longest_string3_returns_last_when_single_char = longest_string4 ["A","B","C"] = "C"

(* Problem 05 - longest_capitalized *)

val longest_capitalized_provided = longest_capitalized ["A","bc","C"] = "A";
val longest_capitalized_avion_cueron = longest_capitalized ["Avion","bc","Cueron"] = "Cueron"
val longest_capitalized_aviona_cueron = longest_capitalized ["Aviona","bc","Cueron"] = "Aviona"

(* Problem 06 - rev_string *)

val rev_string_provided = rev_string "abc" = "cba"
val rev_string_with_space = rev_string "batman forever" = "reverof namtab"
val rev_string_with_multiple_spaces = rev_string "batman forever" = "reverof namtab"

(* Problem 07 - first_answer *)

val first_answer_provided = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val first_answer_exception = (first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3];false) handle _ => true = true

(* Problem 08 - all_answers *)

val all_answers_provided = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val all_answers_take_range = all_answers (fn x => if x > 1 andalso x < 5 then SOME [x] else NONE) [2,3,4] = SOME [2,3,4]
val all_answers_provided_hint = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME []

(* Problem 09 A - *)

val count_wildcards_Passed_Wildcard_instance = count_wildcards Wildcard = 1
val count_wildcards_TupleP_WithThree_Wildcards = count_wildcards(TupleP([Wildcard,Wildcard,Wildcard])) = 3
val count_wildcards_pattern_cocktail = count_wildcards(ConstructorP ("pat",TupleP([Wildcard,Variable("Wildcard"),ConstP(1),Wildcard]))) = 2

(* Problem 09 B - *)

val count_wild_and_variable_lengths_With_Variable_Char = count_wild_and_variable_lengths (Variable("a")) = 1
val count_wild_and_variable_lengths_With_Variable_FiveChars = count_wild_and_variable_lengths (Variable("Pablo")) = 5
val count_wild_and_variable_lengths_cocktail_a = count_wild_and_variable_lengths (TupleP([Wildcard,Variable("a")])) = 2
val count_wild_and_variable_lengths_cocktail_b = count_wild_and_variable_lengths (TupleP([Wildcard,Variable("Pablo")])) = 6

(* Problem 09 C - count_some_var *)

val count_some_var_provided = count_some_var ("x", Variable("x")) = 1;

val count_some_var_coctil_a =
			count_some_var ("Pablo", ConstructorP("pat",TupleP([Wildcard,Variable("Wildcard"),ConstP(1),Wildcard]))) = 0

val count_some_var_coctil_b =
			count_some_var ("Pablo", ConstructorP("pat",TupleP([Wildcard,Variable("Pablo"),ConstP(1),Wildcard]))) = 1