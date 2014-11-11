p3([],[]):- fail.
p3([H|T],H):- member(H,T), !.
p3([_|T],R):- p3(T,R).

lstpares(LP,LR):- lstpares(LP,LA,LR1), append(LR1,LA,LR).
lstpares([],[],[]).
lstpares([(H,H1)|T], [H1|LA], [H|LR]):- lstpares(T,LA,LR).
