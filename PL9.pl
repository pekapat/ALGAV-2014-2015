
niveis(3).
listaAccoes([a1,a2,a3]).

n_clientes(a,900000).
n_clientes(b,1000000).
n_medio_chamadas_por_cliente(a,10).
n_medio_chamadas_por_cliente(b,8).
duracao_media_chamadas_por_cliente(a,2).
duracao_media_chamadas_por_cliente(b,1.7).
custo_por_unidade_tempo(a,40).
custo_por_unidade_tempo(b,55).
custos_operacao_por_cliente(a,500).
custos_operacao_por_cliente(b,550).
custos_com_marketing(a,0).
custos_com_marketing(b,0).

consequencia(a1,[r1,r2,r7]). % Accao 1: reducao do preco das chamadas 
consequencia(a2,[r1,r4,r6]). % Accao 2: marketing (campanhas publicitarias)
consequencia(a3,[r1,r3,r5]). % Accao 3: introducao de novo produto

executa(Accao,Emp,Estado,NovoEstado):-
	consequencia(Accao,ListaReaccoes),
	muda_estado(Emp,Estado,NovoEstado,ListaReaccoes).

muda_estado(_,Estado,Estado,[]).
muda_estado(Emp,Estado,NovoEstado,[R1|LReaccoes]):-
	reaccao(R1,Emp,Estado,NovoEstado1),
	muda_estado(Emp,NovoEstado1,NovoEstado,LReaccoes).

reaccao(r1,a,([P1,P,P3,P4,P5,P6],Eb),([P1,NP,P3,P4,P5,P6],Eb)):-
	NP is P*1.10. % aumento de 10% no numero de chamadas efectuadas
reaccao(r2,a,([P1,P2,P,P4,P5,P6],Eb),([P1,P2,NP,P4,P5,P6],Eb)):-
	NP is P*1.10. % aumento de 10% na dur. med. das chamadas
reaccao(r3,a,([Pa|Ra],[Pb|Rb]),([NPa|Ra],[NPb|Rb])):-
	NPa is Pa+5000,NPb is Pb-5000. % conquista de clientes 
reaccao(r4,a,([P|R],Eb),([NP|R],Eb)):-
	NP is P+100. % Novos clien. que nao eram clien. de qualquer empresa
reaccao(r5,a,([P1,P2,P3,P4,P|R],Eb),([P1,P2,P3,P4,NP|R],Eb)):-
	NP is P*1.02. % Aumento de 2% nos custos de oper. / cliente
reaccao(r6,a,([P1,P2,P3,P4,P5,P],Eb),([P1,P2,P3,P4,P5,NP],Eb)):-
	NP is P+9000000. % Custo com campanha de marketing
reaccao(r7,a,([P1,P2,P3,P|R],Eb),([P1,P2,P3,NP|R],Eb)):-
	NP is P*0.90. % reducao de 10% no custo das chamadas

reaccao(r1,b,(Ea,[P1,P,P3,P4,P5,P6]),(Ea,[P1,NP,P3,P4,P5,P6])):-
	NP is P*1.10. % aumento de 10% no numero de chamadas efectuadas	
reaccao(r2,b,(Ea,[P1,P2,P,P4,P5,P6]),(Ea,[P1,P2,NP,P4,P5,P6])):-
	NP is P*1.05. % aumento de 5% na dur. med. das chamadas
reaccao(r3,b,([Pa|Ra],[Pb|Rb]),([NPa|Ra],[NPb|Rb])):-
	NPa is Pa-1000,NPb is Pb+1000. % conquista de clientes 
reaccao(r4,b,(Ea,[P|R]),(Ea,[NP|R])):-
	NP is P+500. % Novos clien. que nao eram clien. de qualquer empresa
reaccao(r5,b,(Ea,[P1,P2,P3,P4,P|R]),(Ea,[P1,P2,P3,P4,NP|R])):-
	NP is P*1.05. % Aumento de 5% nos custos de oper. / cliente
reaccao(r6,b,(Ea,[P1,P2,P3,P4,P5,P]),(Ea,[P1,P2,P3,P4,P5,NP])):-
	NP is P+1200000. % Custo com campanha de marketing
reaccao(r7,b,(Ea,[P1,P2,P3,P|R]),(Ea,[P1,P2,P3,NP|R])):-
	NP is P*0.80. % reducao de 20% no custo das chamadas

avalia(ListaAccoes,Lucro):-
	estado_inicial(Estado),
	avalia1(ListaAccoes,Estado,EstadoFinal,_),
	lucro(EstadoFinal,Lucro).

avalia1([],Estado,Estado,a). % A primeira a accao e' da empresa 'a'
avalia1([A1|LAccoes],EstIni,EstFin,Emp1):-
	avalia1(LAccoes,EstIni,Estado,Emp),
	executa(A1,Emp,Estado,EstFin),
	(Emp==a,!,Emp1=b;Emp1=a).

estado_inicial(([P1a,P2a,P3a,P4a,P5a,P6a],[P1b,P2b,P3b,P4b,P5b,P6b])):-
	n_clientes(a,P1a),
	n_clientes(b,P1b),
	n_medio_chamadas_por_cliente(a,P2a),
	n_medio_chamadas_por_cliente(b,P2b),
	duracao_media_chamadas_por_cliente(a,P3a),
	duracao_media_chamadas_por_cliente(b,P3b),
	custo_por_unidade_tempo(a,P4a),
	custo_por_unidade_tempo(b,P4b),
	custos_operacao_por_cliente(a,P5a),
	custos_operacao_por_cliente(b,P5b),
	custos_com_marketing(a,P6a),
	custos_com_marketing(b,P6b).

lucro(([P1a,P2a,P3a,P4a,P5a,P6a],[P1b,P2b,P3b,P4b,P5b,P6b]),(LucroA,LucroB)):- 
	LucroA is P1a*P2a*P3a*P4a-P1a*P5a-P6a,
	LucroB is P1b*P2b*P3b*P4b-P1b*P5b-P6b.
	

% Minimax

minimax(LMelhoresAccoes,Lucro):- % LMelhoresAccoes esta' invertida
	niveis(Nniveis),
	minimax(LMelhoresAccoes,Lucro,[],max,Nniveis).

minimax(LMelhoresAccoes,Lucro,LMelhoresAccoes,_,0):-!,
	avalia(LMelhoresAccoes,Lucro).
minimax(LMelhoresAccoes,Lucro,AcumAccoes,Tipo,Nniveis):-
	listaAccoes(LAccoes),
	best(LAccoes,LMelhoresAccoes,Lucro,AcumAccoes,Tipo,Nniveis).

best([A],LMelhoresAccoes,Lucro,AcumAccoes,Tipo,Nniveis):-
	N1 is Nniveis-1,
	(Tipo==max,Tipo1=min,!;Tipo1=max),
	minimax(LMelhoresAccoes,Lucro,[A|AcumAccoes],Tipo1,N1),!,
      write([A|AcumAccoes]),write(Lucro),nl.

best([A1|OutrasA],LMelhoresAccoes,Lucro,AcumAccoes,Tipo,Nniveis):-
	N1 is Nniveis-1,
	(Tipo==max,Tipo1=min,!;Tipo1=max),
	minimax(ListaAccoes1,Lucro1,[A1|AcumAccoes],Tipo1,N1),
      write([A1|AcumAccoes]),write(Lucro1),nl,
	best(OutrasA,ListaAccoes2,Lucro2,AcumAccoes,Tipo,Nniveis),
	betterof(ListaAccoes1,Lucro1,ListaAccoes2,Lucro2,LMelhoresAccoes,Lucro,Tipo).

betterof(LA1,(L1a,L1b),LA2,(L2a,L2b),LA1,(L1a,L1b),Tipo):-
	Tipo==max,L1a>L2a,!;
	Tipo==min,L1b>L2b,!.

betterof(LA1,L1,LA2,L2,LA2,L2,_).
