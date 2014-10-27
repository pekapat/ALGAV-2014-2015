% Exercicio 1

homem(manuel).
homem(anibal).
homem(jose).
homem(fernando).
homem(francisco).
homem(alvaro).
homem(carlos).
homem(paulo).
homem(ricardo).
homem(daniel).
homem(samuel).

mulher(maria).
mulher(alzira).
mulher(marta).
mulher(diana).
mulher(celia).
mulher(delfina).
mulher(zulmira).
mulher(fatima).
mulher(sara).
mulher(adriana).

casados(manuel,maria).
casados(anibal,alzira).
casados(jose,marta).
casados(fernando,diana).
casados(alvaro,celia).
casados(carlos,zulmira).
casados(paulo,fatima).

descendente_direto(marta,manuel,maria).
descendente_direto(fernando,manuel,maria).
descendente_direto(diana,anibal,alzira).
descendente_direto(francisco,anibal,alzira).
descendente_direto(alvaro,anibal,alzira).
descendente_direto(delfina,jose,marta).
descendente_direto(carlos,fernando,diana).
descendente_direto(paulo,fernando,diana).
descendente_direto(sara,alvaro,celia).
descendente_direto(ricardo,carlos,zulmira).
descendente_direto(daniel,carlos,zulmira).
descendente_direto(adriana,paulo,fatima).
descendente_direto(samuel,paulo,fatima).

%Exercicio 2

filho(F,P,M):- homem(F), descendente_direto(F,P,M).
filha(F,P,M):- mulher(F), descendente_direto(F,P,M).

pai(P,F):- homem(P), descendente_direto(F,P,_).
mae(M,F):- mulher(M), descendente_direto(F,_,M).

avô(A,N):- homem(A), descendente_direto(N,P,M), (descendente_direto(P,A,_);descendente_direto(M,A,_)).
avó(A,N):- mulher(A), descendente_direto(N,P,M), (descendente_direto(P,A,_);descendente_direto(M,_,A)).

neto(N,A):- homem(N), (descendente_direto(P,A,_), descendente_direto(N,P,_); 
						descendente_direto(P,_,A), descendente_direto(N,P,_);
						descendente_direto(M,A,_), descendente_direto(N,_,M); 
						descendente_direto(M,_,A), descendente_direto(N,_,M)).

neta(N,A):- mulher(N), (descendente_direto(P,A,_), descendente_direto(N,P,_); 
						descendente_direto(P,_,A), descendente_direto(N,P,_);
						descendente_direto(M,A,_), descendente_direto(N,_,M); 
						descendente_direto(M,_,A), descendente_direto(N,_,M)).

irmao(I,Irmao):- homem(I), descendente_direto(I,P,M), descendente_direto(Irmao,P,M), \+I=Irmao.
irma(I,Irmao):- mulher(I), descendente_direto(I,P,M), descendente_direto(Irmao,P,M), \+I=Irmao.

tio(T,S):- homem(T), (irmao(T,I), (homem(I), descendente_direto(S,I,_); descendente_direto(S,_,I)); irma(T,I), (mulher(I), descendente_direto(S,_,I); descendente_direto(S,I,_))).
tia(T,S):- mulher(T), (irmao(T,I), (homem(I), descendente_direto(S,I,_); descendente_direto(S,_,I)); irma(T,I), (mulher(I), descendente_direto(S,_,I); descendente_direto(S,I,_))).

sobrinho(S,T):- homem(S), (tio(T,S); tia(T,S)).
sobrinha(S,T):- mulher(S), (tio(T,S);tia(T,S)).

primo(P,Primo):- homem(P), (tio(T,P), (homem(T), descendente_direto(Primo,T,_); descendente_direto(Primo,_,T)); 
							tia(T,P), (homem(T), descendente_direto(Primo,T,_); descendente_direto(Primo,_,T))).

prima(P,Primo):- mulher(P), (tio(T,P), (homem(T), descendente_direto(Primo,T,_); descendente_direto(Primo,_,T)); 
							tia(T,P), (homem(T), descendente_direto(Primo,T,_); descendente_direto(Primo,_,T))).

cunhado(C,Cunhado):- homem(C), irmao(C,I), (casados(Cunhado,I); casados(I,Cunhado)).
cunhada(C,Cunhado):- mulher(C), irmao(C,I), (casados(Cunhado,I); casados(I,Cunhado)).

%Exercicio 3

ascendente(X,Y):- descendente_direto(Y,X,_);descendente_direto(Y,_,X).
ascendente(X,Y):- (descendente_direto(Z,X,_);descendente_direto(Z,_,X)),descendente(Z,Y).

% Mal implementado.
%descendentes(X,L):- descendente_direto(Y,X,_), descendentes(Y,L).
%descendentes(X,L):- descendente_direto(Y,_,X), descendentes(Y,L).
%descendentes(X,L):- L = X.

descendente(X,Y):- descendente_direto(X,Y,_);descendente_direto(X,_,Y).
descendente(X,Y):- (descendente_direto(X,Z,_);descendente_direto(X,_,Z)),ascendente(Z,Y).

% Exercicio 4
%mae(maria,joana) = mae(Joana,Maria).
%Joana = maria,
%Maria = joana.
% Acontece porque Joana e Maria são variáveis porque começam por maiscula.

% Exercicio 5

isep(B,B).

%isep(1,A).
%A = 1.

%isep(A,B).
%A = B.

%isep(B,X).
%B = X.

%isep(X,100).
%X = 100.

% Exercicio 6

homem(joao).
homem(manuel).
homem(antonio).

mulher(susana).

loiro(joao).
preto(miguel).
preto(antonio).
loira(joana).
loira(susana).
morena(maria).
morena(ana).

ouro(miguel).
ouro(joana).

gostam(joao,rica).
gostam(miguel,rica).
gostam(joao, loiras).
gostam(miguel, morenas).
gostam(maria,preto).
gostam(joana,preto).
gostam(joana,rico).

carro(ana).
carro(joao).

%a) homem(X).
%b) gostam(joao, X).
%c) gostam(maria, X).
%d) X = homem(X1), gostam(joana,X).


































