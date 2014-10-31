%	Base de conhecimento

liga(a,b).
liga(a,c).
liga(a,d).
liga(b,e).
liga(b,f).
liga(c,f).
liga(c,g).
liga(d,a).
liga(d,g).
liga(d,h).
liga(d,i).
liga(e,j).
liga(f,a).
liga(f,j).
liga(f,k).
liga(g,f).
liga(g,o).
liga(g,h).
liga(h,d).
liga(h,l).
liga(i,l).
liga(j,m).
liga(j,n).
liga(k,n).
liga(k,p).
liga(l,p).

%	Exercício 1.a)

%	Primeiro em profundidade
caminho(O,D,L):- caminho(O,D,[O],L).
caminho(D,D,_,[D]).
caminho(O,D,LA,[O|L]):- liga(O,X), \+member(X,LA), caminho(X,D,[X|LA],L).

%	Primeiro em Largura
%	caminho(O,D,L):- pesquisa([[O]],D,LA), inverte(LA,L).
%	pesquisa([H|T],D,H):- H = [D|_].
%	pesquisa([[D|T]|Resto], D, L):- !, pesquisa(Resto,D,L).
%	pesquisa([[H|T]|Resto],D,L):- findall([X,H|T], proximo_no(H,T,X),Lista), append(Resto,Lista,LA), pesquisa(LA,D,L).

%	proximo_no(X,T,Z):- liga(X,Z), \+member(Z,T).

%	inverte(L,LI) :- inverte(L,[],LI).
%	inverte([],LI,LI).
%	inverte([H|T],L,LI) :- inverte(T,[H|L],LI).
