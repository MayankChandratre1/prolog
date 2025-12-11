% Fibonacci number
fibonacci(0, 0) :- !.
fibonacci(1, 1) :- !.
fibonacci(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

% Print first N fibonacci numbers
print_fibonacci(0) :- !.
print_fibonacci(N) :-
    N > 0,
    N1 is N - 1,
    print_fibonacci(N1),
    fibonacci(N1, F),
    write(F), write(' '), nl.