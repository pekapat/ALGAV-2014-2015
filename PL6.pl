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


%	Exercício 1.b)

todos_caminhos(O,D,L):- findall(P,caminho(O,D,P),L).

%	Exercício 1.c)

menor_caminho(O,D,L):- todos_caminhos(O,D,C), menor(C,L).

menor([H|[]],H):-!.
menor([H|T],M):- menor(T,L1), (length(L1,M1), length(H,M2), M1 < M2, M = L1; M = H).

%	Exercício 2.a)

%	Base de conhecimento

linha(1,[a,b,c,d,e,f]).
linha(2,[g,b,h,i,j,k]).
linha(3,[l,j,m,n,o,d,p]).
linha(4,[f,q,r,s,t]).
linha(5,[t,u,j,v,a,g]).

gera_cruzamentos:- findall(_,cruzamento,_).

cruzamento:- linha(N1,LE1), linha(N2,LE2), N1 \== N2, intersection(LE1,LE2,LI), LI \== [], assertz(cruza(N1,N2,LI)).

%	Exercício 2.b)

gera_estações:- findall(L, linha(_,L), LE), gera_estações(LE,Estacoes), assertz(estações(Estacoes)).

gera_estações([], []).
gera_estações([H|T], LE):- gera_estações(T,LR), union(LR, H, LE).

%	Exercício 2.c)

gera_estação_linhas:- estações(LE), gera_estação_linhas(LE).

gera_estação_linhas([]).
gera_estação_linhas([H|T]):- findall(L, (linha(L,LE), member(H, LE) ), LN), assertz(estação_linha(H,LN)), gera_estação_linhas(T).










