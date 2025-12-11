% Genders
male(dagadu).
male(sanjay).
male(ganesh).

female(mahananda).
female(manisha).
female(uma).

% Parent relationships
% Grandparents -> Parents
parent(dagadu, sanjay).
parent(mahananda, sanjay).

% Parents -> Children
parent(sanjay, ganesh).
parent(sanjay, uma).

parent(manisha, ganesh).
parent(manisha, uma).

% --- RULES (Common Logic) ---

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