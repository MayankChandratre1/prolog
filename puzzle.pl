% ==========================================
% 8-Puzzle with Depth Limit (Prevents Loops)
% ==========================================

goal([1,2,3,
      4,5,6,
      7,8,0]).

% --- List Helpers ---
set_elem([_|T], 0, X, [X|T]).
set_elem([H|T], I, X, [H|R]) :-
    I > 0, I1 is I - 1, set_elem(T, I1, X, R).

swap(List, I, J, Result) :-
    nth0(I, List, A), nth0(J, List, B),
    set_elem(List, I, B, Temp),
    set_elem(Temp, J, A, Result).

% --- Move Logic ---
move(State, NextState) :-
    nth0(Blank, State, 0),
    move_blank(Blank, NewBlank),
    swap(State, Blank, NewBlank, NextState).

move_blank(0,1). move_blank(0,3).
move_blank(1,0). move_blank(1,2). move_blank(1,4).
move_blank(2,1). move_blank(2,5).
move_blank(3,0). move_blank(3,4). move_blank(3,6).
move_blank(4,1). move_blank(4,3). move_blank(4,5). move_blank(4,7).
move_blank(5,2). move_blank(5,4). move_blank(5,8).
move_blank(6,3). move_blank(6,7).
move_blank(7,4). move_blank(7,6). move_blank(7,8).
move_blank(8,5). move_blank(8,7).

% --- SOLVER (Iterative Deepening) ---

solve(Start) :-
    % Try to find path of length 1, then 2, then 3... up to 15
    between(1, 15, Limit),
    write('Searching with depth limit: '), write(Limit), nl,
    path(Start, [Start], Limit).

path(State, Visited, _) :-
    goal(State),
    write('Goal State Reached!'), nl,
    print_path(Visited).

path(State, Visited, Limit) :-
    Limit > 0,
    move(State, Next),
    \+ member(Next, Visited),
    NewLimit is Limit - 1,
    path(Next, [Next | Visited], NewLimit).

% --- Print Path in Correct Order ---
print_path(Visited) :-
    reverse(Visited, Path),
    print_steps(Path).

print_steps([]).
print_steps([H|T]) :-
    print_state(H),
    print_steps(T).

print_state([A,B,C,D,E,F,G,H,I]) :-
    write(A), write(' '), write(B), write(' '), write(C), nl,
    write(D), write(' '), write(E), write(' '), write(F), nl,
    write(G), write(' '), write(H), write(' '), write(I), nl,
    nl.