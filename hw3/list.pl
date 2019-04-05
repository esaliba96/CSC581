split([H|T], H, T).
split([H|T], X, [H|Y]) :- split(T, X, Y).

permutation([X|Y],Z) :- permutation(Y,W), split(Z,X,W).
permutation([],[]).

test([]).

test([X|Y]) :- test(Y), auxtest(X,Y,1).

auxtest(_,[],_).

auxtest(Y,[Y1|Ylist],Xdist) :-
 Y-Y1=\=Xdist,
 Y1-Y=\=Xdist,
 Dist1 is Xdist + 1,
 auxtest(Y,Ylist,Dist1).

queens(X) :- permutation([1,2,3,4,5,6,7,8], X), test(X).
