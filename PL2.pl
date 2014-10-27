% Exercicio 1.a)

potencia(N,1,N):- !.
potencia(N,P,R):- P1 is P - 1, potencia(N,P1,R1), R is N * R1.

% Exercicio 1.b)

factorial(0,1):-!.
factorial(N,R):- N1 is N-1, factorial(N1, R1), R is N * R1.

% Exercicio 1.c)

divisao(N,D,0):- (N == 0 ; N == 1), !. 
divisao(N,D,R):- N1 is N-D, divisao(N1,D,R1), R is R1 + 1.

% Exercicio 1.d)

resto(N,D,N):- N<D, !.
resto(N,D,R1):- N>=D,N1 is N-D, resto(N1, D, R1).

% Exercicio 2

liga(a,b).
liga(a,c).
liga(a,d).
liga(b,e).
liga(b,f).
liga(c,f).
liga(c,g).
liga(d,g).
liga(d,h).
liga(d,i).
liga(e,j).
liga(f,j).
liga(f,k).
liga(g,f).
liga(g,h).
liga(g,o).
liga(h,l).
liga(i,l).
liga(j,m).
liga(j,n).
liga(k,n).
liga(k,p).
liga(l,p).

caminho(O,O):- write(O), write(' ; ').
caminho(O,D):- liga(X,D), caminho(O,X), write(D), write(' ; ').

% Exercicio 3

hanoi(N):- move(N,esquerda,centro,direita,0,_).
move(0,_,_,_,I,I):- !.
move(N,A,B,C,I,I2):- M is N-1, move(M,A,C,B,I,I1), J is I1+1, informa(A,B,J), move(M,C,B,A,J,I2).
informa(A,B,J):- write(J), write(' MOVER DISCO DE '), write(A), write(' PARA '), write(B), nl.

% hanoi(X) = hanoi(X - 1) * 2 + 1.

% hanoi(X) = X * (X - 1) + (X - 1).

% hanoi(X) = 2^X - 1.

% Exercicio 4

primo(N):- primo(N,2).
primo(N,D):- N2 is N//2, D =< N2, R is N mod D, R == 0, !, fail.
primo(_,_).

% Exercicio 5

fibonnaci(N):- fibonnaci(N,1).
fibonnaci(N,N).







