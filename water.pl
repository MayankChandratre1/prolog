% Represent state as state(Jug5, Jug3)
goal(state(4,_)).     % Goal: 4 liters in 5L jug
% Valid moves
move(state(X,Y), state(5,Y)) :- X < 5.      
move(state(X,Y), state(X,3)) :- Y < 3.        
move(state(X,Y), state(0,Y)) :- X > 0.        
move(state(X,Y), state(X,0)) :- Y > 0.       
move(state(X,Y), state(X1,Y1)) :-            
    X > 0, Y < 3,
    Transfer is min(X, 3-Y),
    X1 is X - Transfer,
    Y1 is Y + Transfer.
move(state(X,Y), state(X1,Y1)) :-            
    Y > 0, X < 5,
    Transfer is min(Y, 5-X),
    Y1 is Y - Transfer,
    X1 is X + Transfer.
% DFS to find solution
solve(Start) :-
    dfs(Start, []).
dfs(State, _) :-
    goal(State),
    write('Goal reached: '), write(State), nl, !.
dfs(State, Visited) :-
    write('Current state: '), write(State), nl,
    move(State, Next),
    \+ member(Next, Visited),
    dfs(Next, [State | Visited]).