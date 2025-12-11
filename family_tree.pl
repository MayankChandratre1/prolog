% --- Facts based on your input ---

% Gender definitions
male(madan).
female(manjiri).
male(mandar).
female(malvika).
male(mayank).
male(mihir).

% Parent relationships
% Grandparents to Parents
parent(madan, mandar).
parent(manjiri, mandar).

% Parents to Children
parent(mandar, mayank).
parent(mandar, mihir).
parent(malvika, mayank).
parent(malvika, mihir).

% --- Rules (Logic) from Assignment 4 ---

% X is a grandparent of Y if X is a parent of Z, and Z is a parent of Y
grandparent(X, Y) :- 
    parent(X, Z), 
    parent(Z, Y).

% X and Y are siblings if they share a parent Z and X is not Y
sibling(X, Y) :- 
    parent(Z, X), 
    parent(Z, Y), 
    X \= Y.

% X is the father of Y if X is a parent of Y and X is male
father(X, Y) :- 
    parent(X, Y), 
    male(X).

% X is the mother of Y if X is a parent of Y and X is female
mother(X, Y) :- 
    parent(X, Y), 
    female(X).

% X is an ancestor of Y (Recursive definition)
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% X is a descendant of Y
descendant(X, Y) :- ancestor(Y, X).