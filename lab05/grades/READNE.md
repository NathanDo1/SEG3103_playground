After replacing the stubbed application with the application from assignment 2, the module continue to not work as expected.
"** (ArithmeticError) bad argument in arithmetic expression" is the error expected to get when this happen. 
More specifically: 
:erlang.+("100", 0)
(elixir) lib/enum.ex:1948: Enum."-sum/1-lists^foldl/2-0-"/2
(grades) lib/grades/calculator.ex:53: Grades.Calculator.letter_grade/1

This error is saying that the grades module in particular the calculator module is expecting the input to be an integer, where the Enum.sum function can then calculate the sum of the grades, however the input is being inputted as "100" or the string of the number 100.
This is what is causing the error