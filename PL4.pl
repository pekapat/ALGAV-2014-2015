%   Exercício 3
%   a)
conta([],0).
conta([H|T],C):-conta(T,C1),C is C1+1.

%   b)
soma([],0).
soma([H|T],S):-soma(T,S1),S is S1+H.

%   c)
media(L,M):-soma(L,S),conta(L,C),M is S/C.

%   d)
menor([H|[]],H):-!.
menor([H|T],M):-menor(T,M1),(M1<H, M is M1; M is H).

%   e)
conta_valores([],0,_,_).
conta_valores([H|T],C,I,F):-conta_valores(T,C1,I,F), !, (H>I,H<F, C is C1+1;C is C1).

%	Exercício 4
lista([]).
lista([A|B]).

%	Exercício 5
repetidos(L):- repetidos(L,V).
repetidos([H|T], H):- member(H,T),!.
repetidos(L,C):-fail.

%	Exercício 6
prodVec([],[],0).
prodVec([H1|T1], [H2|T2], LV):- R is H1 * H2, prodVec(T1,T2,LV1), LV is LV1 + R. 