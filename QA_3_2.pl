%Caminho de duplo sentido entre 2 locais e respetivo custo 
caminho(a,b,1).
caminho(a,c,3).
caminho(a,d,4).
caminho(b,c,5). 
caminho(b,e,5). 
caminho(c,e,4). 
caminho(d,f,2). 
caminho(e,f,3).
%Método de pesquisa. 
pesquisa(Origem,Destino,Max,Perc):- pesquisa1([([Origem],0)],Destino,Max,Perc).

pesquisa1([([A|T],C)|R],D,Max,P):- proximos(A,T,Max,L,C), append(R,L,NL), findall(([S1,A1|T1],Cs1), (member(([S1,A1|T1],Cs1), NL), Cs1 < 8), CL), pesquisa1(CL,D,Max,P).

proximos(A,T,Max,L,C):- findall(([S,A|T],Cs), ((caminho(A,S,Ca);caminho(S,A,Ca)), Ca < Max, Cs is C + Ca), L).