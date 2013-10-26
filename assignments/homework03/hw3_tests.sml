(* Problem 01 - only_capitals *)

val only_capitals_test_list_of_UpperChars = only_capitals ["A","B","C"] = ["A","B","C"]
val only_capitals_none_capitalized = only_capitals ["pablo","batida","vive"] = []
val only_capitals_empty_list_should_return_emtpy_list = only_capitals [] = []

(* Problem 02 - longest_string1 *)

val longest_string1_A_bc_D_returns_bc = longest_string1 ["A","bc","D"] = "bc"
val longest_string1_A_bc_D_ef_returns_bc = longest_string1 ["A","bc","D", "ef"] = "bc"
val longest_string1_tide_returns_left = longest_string1 ["A","bc","D", "pablo", "batid"] = "pablo"
val longest_string1_empty_list = longest_string1 [] = ""

(* Problem 03 - longest_string2 *)

val longest_string2_A_bc_D_returns_bc = longest_string2 ["A","bc","D"] = "bc"
val longest_string2_A_bc_D_ef_returns_ef = longest_string2 ["A","bc","D", "ef"] = "ef"
val longest_string2_tide_returns_left = longest_string2 ["A","bc","D", "pablo", "batid"] = "batid"
val longest_string2_empty_list = longest_string2 [] = ""