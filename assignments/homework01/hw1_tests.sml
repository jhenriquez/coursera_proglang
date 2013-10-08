(* Load Homework Assignments Source *)
use "hw1.sml";

(* Question 1 - is_older *)

val is_older_TRUE_when_year_smaller = is_older((1,2,3),(2,2,3)) = true; 
val is_older_TRUE_when_month_smaller = is_older((1,2,3),(2,2,3)) = true; 
val is_older_TRUE_day_smaller = is_older((1,2,2),(1,2,3)) = true; 
val is_older_FALSE_when_year_greater = is_older((2,4,3),(1,2,3)) = false; 
val is_older_FALSE_when_month_greater = is_older((1,4,2),(1,2,3)) = false;
val is_older_FALSE_day_greater = is_older((1,2,4),(1,2,3)) = false;
val is_older_FALSE_when_all_three_are_equal = is_older((1,2,3),(1,2,3)) = false;

(* Question 2 - number_in_month *)

val number_in_month_returns_TWO = number_in_month([(1,2,5),(1,2,6),(1,5,5)], 2) = 2;
val number_in_month_returns_ONE = number_in_month([(1,2,5),(1,4,6),(1,5,5)], 2) = 1;
val number_in_month_returns_FOUR = number_in_month([(1,2,5),(1,2,6),(2,2,5),(2,2,7),(1,5,5)], 2) = 4;
val number_in_month_returns_ZERO_when_list_empty = number_in_month ([], 2) = 0;

val number_in_months_returns_FOUR = number_in_months ([(1,2,5),(1,2,6),(2,2,5),(2,2,7),(1,5,5)], [2,5]) = 4;
val number_in_months_returns_ZERO_when_not_found = number_in_months ([(1,2,5),(1,2,6),(2,2,5),(2,2,7),(1,5,5)], [1,7]) = 0;
val number_in_months_returns_ZERO_when_not_found = number_in_months ([(1,2,5),(1,2,6),(2,2,5),(2,2,7),(1,5,5)], [1,5]);
