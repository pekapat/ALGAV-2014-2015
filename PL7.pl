liga(a,b).
liga(a,e).
liga(a,d).
liga(b,a).
liga(b,c).
liga(b,f).
liga(c,b).
liga(c,f).
liga(d,a).
liga(d,e).
liga(d,g).
liga(e,a).
liga(e,d).
liga(e,f).
liga(f,b).
liga(f,c).
liga(f,e).
liga(f,h).
liga(g,d).
liga(g,h).
liga(h,f).
liga(h,g).

%	Exercício 1

circuito(O,D,L):- circuito(O,D,[O],L), todos_nos(L2), circuito(L,L2).
circuito(O,O,_,[O]).
circuito(O,D,V,[O|L]):- (liga(O,X); liga(X,O),
	\+member(X,V)),
	circuito(X,D,[X|V],L).

circuito(O,L):- circuito(O,X,L),
	(liga(X,O); liga(O,X)),
	todos_nos(L2),
	length(L2,N),
	length(L,N).

todos_nos(L):- setof(X,X^Y^(liga(X,Y); liga(Y,X)),L).


%       Exercício 2





