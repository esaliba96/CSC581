split([H|T], H, T).
split([H|T], X, [H|Y]) :- split(T, X, Y).

permutation([X|Y],Z) :- permutation(Y,W), split(Z,X,W).
permutation([],[]).

test([]).

test([X|Y]) :- test(Y), combine(X,Y,Z,W).


combine([X1|X],[Y1|Y],[S1|S],[D1|D]) :-
     S1 is X1 +Y1,
     D1 is X1 - Y1, 
     combine(X,Y,S,D).
combine([],[],[],[]).

queens(X) :- permutation([1,2,3,4,5,6,7,8], X), test(X).

