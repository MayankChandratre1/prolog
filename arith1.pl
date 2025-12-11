% Check if a number is prime
is_prime(2) :- !.
is_prime(N) :-
    N > 2,
    N mod 2 =\= 0,
    \+ has_odd_divisor(N, 3).

has_odd_divisor(N, D) :-
    D * D =< N,
    (N mod D =:= 0 ; D1 is D + 2, has_odd_divisor(N, D1)).

% Find all primes up to N
primes_up_to(N, Primes) :-
    findall(X, (between(2, N, X), is_prime(X)), Primes).