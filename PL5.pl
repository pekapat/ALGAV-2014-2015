%	Exercício 1

%	a)
elimina1(V,[],[]):- write('Não havia nenhum elemento com o valor '), write(V), nl, fail.
elimina1(V,[V|T],T):-!.
elimina1(V,[H|T],[H|LR]):- elimina1(V,T,LR).

%	b)
elimina_todos(V,[],[]).
elimina_todos(V,[V|T],LR):- elimina_todos(V,T,LR), !.
elimina_todos(V,[H|T], [H|LR]):- elimina_todos(V,T,LR).

%	Exercício 2
p([],[]). 
p(L, [X|L1]):- elimina1(X,L,Li), p(Li,L1).

%	Exercício 3
substitui(S,V,[],[]).
substitui(S,V,[S|T], [V|L]):- substitui(S,V,T,L), !.
substitui(S,V,[H|T],[H|L]):- substitui(S,V,T,L).

%	Exercício 4
insere(V,P,L,LR):- insere(V,P,L,LR,1).
insere(V,P,L,[V|L],P):-!.
insere(V,P,[H|T],[H|LR],C):- C1 is C + 1, insere(V,P,T,LR,C1). 

%	Exercício 5
inverte(L,LI):- inverte1(L,[ ],LI).
inverte1([ ],L,L).
inverte1([X|L],LI,LF):- inverte1(L,[X|LI],LF).