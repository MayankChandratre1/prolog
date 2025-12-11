% --- Facts & Constants ---
initial_state(state(at_door, at_door, onfloor, hanging)).
goal_state(state(_, _, _, grasped)).

% --- Move Rules ---

% 1. Walk from Door to Banana
move(state(at_door, CrateLoc, onfloor, Banana),
     state(at_banana, CrateLoc, onfloor, Banana), 'Walk to Banana').

% 2. Walk from Banana to Door
move(state(at_banana, CrateLoc, onfloor, Banana),
     state(at_door, CrateLoc, onfloor, Banana), 'Walk to Door').

% 3. Push Crate from Door to Banana (FIXED: Monkey moves WITH crate)
move(state(at_door, at_door, onfloor, Banana),
     state(at_banana, at_banana, onfloor, Banana), 'Push Crate to Banana').

% 4. Push Crate from Banana to Door (FIXED: Monkey moves WITH crate)
move(state(at_banana, at_banana, onfloor, Banana),
     state(at_door, at_door, onfloor, Banana), 'Push Crate to Door').

% 5. Climb Crate
move(state(at_banana, at_banana, onfloor, Banana),
     state(at_banana, at_banana, oncrate, Banana), 'Climb Crate').

% 6. Grasp Banana
move(state(at_banana, at_banana, oncrate, hanging),
     state(at_banana, at_banana, oncrate, grasped), 'Grasp Banana').

% --- Solver (FIXED with Cycle Detection) ---

% Entry point for the user
solve_problem :-
    initial_state(Start),
    solve(Start, [], Path),  % Start with empty visited list
    write('Solution Path:'), nl,
    print_path(Path).

% Base Case: Goal reached
solve(State, _, []) :-
    goal_state(State).

% Recursive Step: Try a move
solve(CurrentState, Visited, [Action | Path]) :-
    move(CurrentState, NextState, Action),
    \+ member(NextState, Visited),       
    solve(NextState, [NextState | Visited], Path).

% Helper to print the path neatly
print_path([]).
print_path([Action | Rest]) :-
    write(' -> '), write(Action), nl,
    print_path(Rest).