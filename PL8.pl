%	Base de conhecimento

%	cidade(Nome, PosX, PosY).

cidade(a,45,95). 
cidade(b,90,95). 
cidade(c,15,85). 
cidade(d,40,80). 
cidade(e,70,80). 
cidade(f,25,65). 
cidade(g,65,65). 
cidade(h,45,55). 
cidade(i,5,50). 
cidade(j,80,50). 
cidade(l,65,45). 
cidade(m,25,40). 
cidade(n,55,30). 
cidade(o,80,30). 
cidade(p,25,15). 
cidade(q,80,15). 
cidade(r,55,10).

%	estrada(CidadeOrigem, CidadeDestino, Distância).

estrada(a,b,45). 
estrada(a,c,32). 
estrada(a,d,16). 
estrada(a,e,30). 
estrada(b,e,25). 
estrada(d,e,30). 
estrada(c,d,26). 
estrada(c,f,23). 
estrada(c,i,37). 
estrada(d,f,22). 
estrada(f,h,23). 
estrada(f,m,25). 
estrada(f,i,25). 
estrada(i,m,23). 
estrada(e,f,48). 
estrada(e,g,16). 
estrada(e,j,32). 
estrada(g,h,23). 
estrada(g,l,20). 
estrada(g,j,22). 
estrada(h,m,25). 
estrada(h,n,27). 
estrada(h,l,23). 
estrada(j,l,16). 
estrada(j,o,20). 
estrada(l,n,19). 
estrada(l,o,22). 
estrada(m,n,32). 
estrada(m,p,25). 
estrada(n,p,34). 
estrada(n,r,20). 
estrada(o,n,25). 
estrada(o,q,15). 
estrada(p,r,31).


%	Exercício 1

hbf(Orig,Dest,Perc,Total):-
			estimativa(Orig,Dest,H), F is H + 0, % G = 0
			hbf1([c(F/0,[Orig])],Dest,P,Total),
			reverse(P,Perc).

hbf1(Percursos,Dest,Percurso,Total):-
			menor_percurso(Percursos,Menor,Restantes),
			percursos_seguintes(Menor,Dest,Restantes,Percurso,Total).

percursos_seguintes(c(_/Dist,Percurso),Dest,_,Percurso,Dist):- Percurso=[Dest|_].

percursos_seguintes(c(_,[Dest|_]),Dest,Restantes,Percurso,Total):-!,
	hbf1(Restantes,Dest,Percurso,Total).

percursos_seguintes(c(_/Dist,[Ult|T]),Dest,Percursos,Percurso,Total):-
	findall(c(F1/D1,[Z,Ult|T]),proximo_no(Ult,T,Z,Dist,Dest,F1/D1),Lista),
	append(Lista,Percursos,NovosPercursos),
	hbf1(NovosPercursos,Dest,Percurso,Total).

proximo_no(X,T,Y,Dist,Dest,F/Dist1):-
				(estrada(X,Y,Z);estrada(Y,X,Z)),
				\+ member(Y,T),
				Dist1 is Dist + Z,
				estimativa(Y,Dest,H), F is H + Dist1.

menor_percurso([H|Percurso], Menor, [H| Percurso1]):- 
menor_percurso(Percurso, Menor, Percurso1),
	menor(H,Menor),!.

menor_percurso([H|T],H,T).

menor(c(A1,B1,_), c(A2,B2,_)):- As1 is A1 + B1, As2 is A2 + B2, As2 < As1.

estimativa(C1,C2,Est):-
		cidade(C1,X1,Y1),
		cidade(C2,X2,Y2),
		DX is X1-X2,
		DY is Y1-Y2,
		Est is sqrt(DX*DX+DY*DY).

% estimativa(_,_,0). % para desprezar a heurística.






