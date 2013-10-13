(* Load Homework Assignments Source *)
use "hw1.sml";

(* Problem 01 - is_older *)

val is_older_TRUE_when_year_smaller = is_older((1,2,3),(2,2,3)) = true; 
val is_older_TRUE_when_month_smaller = is_older((1,2,3),(2,2,3)) = true; 
val is_older_TRUE_day_smaller = is_older((1,2,2),(1,2,3)) = true; 
val is_older_FALSE_when_year_greater = is_older((2,4,3),(1,2,3)) = false; 
val is_older_FALSE_when_month_greater = is_older((1,4,2),(1,2,3)) = false;
val is_older_FALSE_day_greater = is_older((1,2,4),(1,2,3)) = false;
val is_older_FALSE_when_all_three_are_equal = is_older((1,2,3),(1,2,3)) = false;

(* Problem 02 - number_in_month *)

val number_in_month_returns_TWO = number_in_month([(1,2,5),(1,2,6),(1,5,5)], 2) = 2;
val number_in_month_returns_ONE = number_in_month([(1,2,5),(1,4,6),(1,5,5)], 2) = 1;
val number_in_month_returns_FOUR = number_in_month([(1,2,5),(1,2,6),(2,2,5),(2,2,7),(1,5,5)], 2) = 4;
val number_in_month_returns_ZERO_when_list_empty = number_in_month ([], 2) = 0;
val number_in_month_works_when_date_in_the_middle = number_in_month ([(1,1,5),(1,4,6),(1,2,5)], 2) = 1;

(* Problem 03 - number_in_months *)

val number_in_months_returns_ZERO_when_not_found = number_in_months ([(1,2,5),(1,2,6),(2,2,5),(2,2,7),(1,5,5)], [1,7]) = 0;
val number_in_months_returns_FOUR = number_in_months ([(1,2,5),(1,3,6),(2,5,5),(2,2,7),(1,5,5)], [2,5]) = 4;
val number_in_months_returns_ONE = number_in_months ([(1,2,5),(1,2,6),(2,2,5),(2,2,7),(1,5,5)], [1,5,0]) = 1;
val number_in_months_returns_ZERO_when_empty_list = number_in_months ([(1,2,5),(1,2,6)], []) = 0;
val number_in_months_returns_COUNT_when_single_element = number_in_months ([(1,2,5)], [2,2]) = 2;

(* Problem 04 - dates_in_month *)

val dates_in_month_find_date_on_list_begenning = dates_in_month ([(1,2,5),(1,3,5)],2) = [(1,2,5)];
val dates_in_month_find_date_on_list_end = dates_in_month ([(1,2,5),(1,3,5)],3) = [(1,3,5)];
val dates_in_month_return_empty_list_when_not_found = dates_in_month ([(1,5,5),(1,3,5)],2) = [];
val dates_in_month_dates_are_returned_in_order = dates_in_month ([(1,2,5),(1,7,6),(2,2,5),(2,4,7),(1,2,5)], 2) = [(1,2,5),(2,2,5),(1,2,5)];

(* Problem 05 - dates_in_months *)

val dates_in_months_find_date_on_list_begenning = dates_in_months ([(1,2,5),(1,3,5)],[2,3]) = [(1,2,5),(1,3,5)];
val dates_in_months_works_with_single_item = dates_in_months ([(1,2,5),(1,3,5)],[3]) = [(1,3,5)];
val dates_in_months_return_empty_list_when_not_found = dates_in_months ([(1,5,5),(1,3,5)],[2,7,6]) = [];
val dates_in_months_dates_are_returned_in_order = dates_in_months ([(1,2,5),(1,7,6),(2,2,5),(2,4,7),(1,2,5)], [2]) = [(1,2,5),(2,2,5),(1,2,5)];

(* Problem 06 - get_nth *)

val get_nth_when_list_empty_returns_empty_string = get_nth ([],5) = "";
val get_nth_when_list_smaller_than_index_return_empty_string = get_nth (["One","Two","Three"],4) = "";
val get_nth_can_return_middle_elements_second = get_nth (["One","Two","Three"],2) = "Two";
val get_nth_can_return_last_element = get_nth (["One","Two","Three"],3) = "Three";
val get_nth_can_return_first_element = get_nth (["One","Two","Three"],1) = "One";
val get_nth_returns_empty_str_when_index_zero_on_empty_list = get_nth ([],0) = "";
val get_nth_returns_empty_str_when_index_zero_on_not_empty_list = get_nth (["One","Two","Three"],0) = "";

(* Problem 07 - date_to_string *)

val date_to_string_returns_October_11_2013 = date_to_string (2013,10,11) = "October 11, 2013";
val date_to_string_returns_January_1_1 = date_to_string (1,1,1) = "January 1, 1";

(* Problem 08 - number_before_reaching_sum *)

val number_before_reaching_sum_sample_test = number_before_reaching_sum (10,[1,2,3,4,5]) = 3;

val number_before_reaching_sum_test1 = number_before_reaching_sum (3, [6, 7]) = 0;
val number_before_reaching_sum_test2 = number_before_reaching_sum (13, [10, 6, 7]) = 1;
val number_before_reaching_sum_test3 = number_before_reaching_sum (15, [2, 10, 6, 7]) = 2;
val number_before_reaching_sum_test4 = number_before_reaching_sum (18, [3, 2, 10, 6, 7]) = 3;
val number_before_reaching_sum_test5 = number_before_reaching_sum (23, [5, 3, 2, 10, 6, 7]) = 4;

(*Problem 09 - what_month *)

val what_month_test1 = what_month (1) = 1;
val what_month_test2 = what_month (2) = 1;
val what_month_test3 = what_month (365) = 12;
val what_month_test4 = what_month (364) = 12;