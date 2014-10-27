% Exercicio 1
% a) 6
% b) 1) 1; 2) 1; 3) 6
% c) É a implementação pela negativa, em que falha sempre que queremos o resultado pretendido e termina quando não existem mais resultados.
% d) 

mulher(maria,30).
mulher(rosa,15).
mulher(teresa,21).

homem(pedro,18).
homem(tiago,43).

par(X,Y):- !, homem(X,IX), mulher(Y,IY).

mostra_par:- par(X,Y), write(X), write(' '), write(Y), nl, fail; true.

escolhe_par(X,Y,MAX,SOM):- MAX < 36, write('Introduce a MAX value bigger then 36'), fail.
escolhe_par(X,Y,MAX,SOM):- homem(X,IX), mulher(Y,IY), SOM is IX + IY, SOM =< MAX.

% Exercicio 2

cor(céu, azul).
cor(céu, cinzento).
cor(céu, preto).
cor(mar, azul).
cor(mar, verde).
cor(mar, cinzento).
cor(via, cinzenta).
cor(via, castanha).
cor(via, preta).

transporte(céu, avião).
transporte(céu, helicóptero).
transporte(céu, foguete).
transporte(mar, navio).
transporte(mar, lancha).
transporte(via, carro).
transporte(via, camião).
transporte(via, mota).
transporte(via, autocarro).

% Exercicio 2.1

nega(P):- call(P), !, fail;true.

% Exercicio 2.2

se_entao_senao(P,S,F):- call(P), S; F.

% Exercicio 3

se_entao(P,S):- call(P), S; true.

% Exercicio 4

questão(Q):- repeat, write('Qual é o atributo? '), read(A), (A == 'cor'; A == 'transporte'),
nl, repeat, write('Qual é o objeto? '), read(O), (O == 'céu'; O == 'mar'; O == 'via'), 
nl, repeat, write('Qual é o valor do/da '), write(A), write(' do/da '), write(O), write('? '), read(V), P =.. [A,O,V], call(P), !, Q = V.











