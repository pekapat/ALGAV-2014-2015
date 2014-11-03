%	1)

p1([]). 
p1([H|T]):- number(H), R is mod(H,2), R == 0, !, write(H), p1(T).
p1([_|T]):- p1(T).

%	2)

p2([H|T], L2):- p2(T,L2,H).

%	Erro: Se receber [a,a,a], vai retornar L = [a,a].
p2([],[],_).
p2([H|T], [H|L2], H):- !, p2(T,L2,H).
p2([H|T],L2,_):- p2(T,L2,H).