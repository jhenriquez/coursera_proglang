(* Problem 01 *)

val all_except_option_no_option = all_except_option ("polo",["no", "option"]) = NONE
val all_except_option_exists_one_element_list = all_except_option ("string",["string"]) = SOME []
val all_except_option_option_in_middle = all_except_option ("2",["1","2","3","4"]) = SOME ["1","3","4"]
val all_except_option_empty_list = all_except_option ("1",[]) = NONE
val all_except_option_at_start = all_except_option ("1",["1","2","3"]) = SOME ["2","3"]
val all_except_option_at_end = all_except_option ("4",["1","2","3","4"]) = SOME ["1","2","3"]