(*Problem 01 - only_capitals *)

val only_capitals_test_list_of_UpperChars = only_capitals ["A","B","C"] = ["A","B","C"]
val only_capitals_none_capitalized = only_capitals ["pablo","batida","vive"] = []
val only_capitals_empty_list_should_return_emtpy_list = only_capitals [] = []