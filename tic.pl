% Program: Tic-Tac-Toe (tic.pl)

% --- 1. Start Game ---
play :-
    initial_board(Board),
    display_board(Board),
    write('Game Start! You are X.'), nl,
    play_turn(Board, x).

initial_board(['-','-','-','-','-','-','-','-','-']).

% --- 2. Display Board ---
display_board([A,B,C,D,E,F,G,H,I]) :-
    nl,
    write(' '), write(A), write(' | '), write(B), write(' | '), write(C), nl,
    write('---+---+---'), nl,
    write(' '), write(D), write(' | '), write(E), write(' | '), write(F), nl,
    write('---+---+---'), nl,
    write(' '), write(G), write(' | '), write(H), write(' | '), write(I), nl,
    nl.

% --- 3. Game Logic ---

% Condition: X Wins
play_turn(Board, x) :-
    win(x, Board),
    write('X Wins!'), nl.

% Condition: O Wins
play_turn(Board, o) :-
    win(o, Board),
    write('O Wins!'), nl.

% Condition: Draw
play_turn(Board, _) :-
    \+ member('-', Board),
    write('It is a Draw!'), nl.

% Turn: X (Human Player)
play_turn(Board, x) :-
    write('Enter move (1-9): '),
    read(Pos),
    (valid_move(Board, Pos) ->
        update_board(Board, Pos, x, NewBoard),
        display_board(NewBoard),
        play_turn(NewBoard, o)
    ;
        write('Invalid move! Try again.'), nl,
        play_turn(Board, x)
    ).

% Turn: O (Computer - Simple Random AI)
play_turn(Board, o) :-
    write('Computer (O) is thinking...'), nl,
    move_computer(Board, NewBoard),
    display_board(NewBoard),
    play_turn(NewBoard, x).

% --- 4. Helpers ---

% Check if move is valid (spot is empty '-')
valid_move(Board, Pos) :-
    nth1(Pos, Board, '-').

% Update the list with the move
update_board([_|T], 1, Player, [Player|T]).
update_board([H|T], Pos, Player, [H|Rest]) :-
    Pos > 1,
    Pos1 is Pos - 1,
    update_board(T, Pos1, Player, Rest).

% Computer Logic: Pick the first available empty spot
move_computer(Board, NewBoard) :-
    nth1(Pos, Board, '-'),
    update_board(Board, Pos, o, NewBoard), !.

% --- 5. Winning Conditions ---
% Rows
win(P, [P,P,P,_,_,_,_,_,_]).
win(P, [_,_,_,P,P,P,_,_,_]).
win(P, [_,_,_,_,_,_,P,P,P]).
% Columns
win(P, [P,_,_,P,_,_,P,_,_]).
win(P, [_,P,_,_,P,_,_,P,_]).
win(P, [_,_,P,_,_,P,_,_,P]).
% Diagonals
win(P, [P,_,_,_,P,_,_,_,P]).
win(P, [_,_,P,_,P,_,P,_,_]).