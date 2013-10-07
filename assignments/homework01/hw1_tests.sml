
(* Load Homework Assignments Source *)
use "hw1.sml";

(* Question 1 - is_older *)

val is_older_TRUE_when_year_smaller = is_older((1,2,3),(2,2,3)); (* Test 1 *)
val is_older_TRUE_when_month_smaller = is_older((1,2,3),(2,2,3)); (* Test 2 *)
val is_older_TRUE_day_smaller = is_older((1,2,2),(1,2,3)); (* Test 3 *)
val is_older_FALSE_when_year_greater = is_older((2,4,3),(1,2,3)); (* Test 5 *)
val is_older_FALSE_when_month_greater = is_older((1,4,2),(1,2,3)); (* Test 4 *)
val is_older_FALSE_day_greater = is_older((1,2,4),(1,2,3)); (* Test 6 *)
val is_older_FALSE_when_all_three_are_equal = is_older((1,2,3),(1,2,3)); (* Test 7 *)
