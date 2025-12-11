% Calculator predicate
calc(Operator, X, Y, Result) :-
    Operator = '+', Result is X + Y;
    Operator = '-', Result is X - Y;
    Operator = '*', Result is X * Y;
    Operator = '/', Y \= 0, Result is X / Y;
    Operator = 'mod', Result is X mod Y.