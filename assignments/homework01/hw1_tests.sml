
(* Load Homework Assignments Source *)
use "hw1.sml";

(* Question 1 - is_older *)

val is_older_true_when_year_is_smaller = is_older((1,2,3),(2,2,3));
val is_older_true_when_month_is_smaller = is_older((1,2,3),(2,2,3));
val is_older_true_when_month_is_greater_and_year_equal_day_smaller = is_older((1,4,2),(1,2,3));
val is_older_false_when_month_is_greater_and_year_equal = is_older((1,4,3),(1,2,3));
val is_older_false_when_year_is_greater = is_older((2,4,3),(1,2,3));
