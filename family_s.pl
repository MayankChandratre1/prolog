% --- FACTS ---

% Genders
male(panchakshri).
male(nagraj).
male(shri).
male(abhi).

female(vachala).
female(ashwini).
female(nikita).

% Parent relationships
% Grandparents are parents of the Father (Nagraj)
parent(panchakshri, nagraj).
parent(vachala, nagraj).

% Nagraj and Ashwini are parents of Nikita, Shri, and Abhi
parent(nagraj, nikita).
parent(nagraj, shri).
parent(nagraj, abhi).

parent(ashwini, nikita).
parent(ashwini, shri).
parent(ashwini, abhi).

% --- RULES ---

% Basic relationships
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).

% Grandparent logic
grandfather(X, Y) :- parent(X, Z), parent(Z, Y), male(X).
grandmother(X, Y) :- parent(X, Z), parent(Z, Y), female(X).

% Sibling logic
sibling(X, Y) :- 
    parent(Z, X), 
    parent(Z, Y), 
    X \= Y.

% Specific sibling roles
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).

% Ancestor logic (Recursive)
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).