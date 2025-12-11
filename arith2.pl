% Calculate GCD using Euclidean algorithm
gcd(A, 0, A) :- !.
gcd(A, B, G) :-
    B > 0,
    R is A mod B,
    gcd(B, R, G).

% Calculate LCM
lcm(A, B, L) :-
    gcd(A, B, G),
    L is (A * B) // G.