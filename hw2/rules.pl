crossword(V1, V2, V3, H1, H2, H3) :-
    word(V1, _,A,_,B,_,C,_),
    word(V2, _,D,_,E,_,F,_),
    word(V3, _,G,_,H,_,I,_),
    word(H1, _,A,_,D,_,G,_),
    word(H2, _,B,_,E,_,H,_),
    word(H3, _,C,_,F,_,I,_).
