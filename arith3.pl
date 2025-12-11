% Program: Count to 10

% Base case: When the number is 10, print it and stop.
count_to_10(10) :- 
    write(10), nl.

% Recursive step: Print X, calculate Y = X + 1, then count(Y).
count_to_10(X) :-
    write(X), nl,
    Y is X + 1,
    count_to_10(Y).