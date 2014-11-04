%	1)

p1([]).
p1([H|T]):- number(H), R is mod(H,2), R == 0, !, write(H), p1(T).
p1([_|T]):- p1(T).

%	2)

p2([],[]).
p2([H,H|T],[H|L2]):- p2(T,L2), !.
p2([_|T],L2):- p2(T,L2).
