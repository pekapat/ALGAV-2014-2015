ve(v1, v2, 1).
ve(v1, v3, 3).
ve(v2, v4, 1).
ve(v2, v5, 2).
ve(v2, v7, 2).
ve(v3, v5, 1).
ve(v3, v6, 4).
ve(v5, v7, 2).
ve(v5, v8, 1).
ve(v6, v7, 3).

retransmissor([v1,v2,v3,v5,v6]).

empresa(a, [v1,v3,v4]).
empresa(b, [v2,v5,v6,v7]).
empresa(c, [v8]).

%	Exercício 1
retrans_emp(L):-retransmissor(LR), findall((E,N), (empresa(E,LV), intersection(LV,LR,LVR), length(LVR, N)), L).

%	Exercício 2
caminho_qos(Vo, Vd, C, QoS):- go1(Vd, [(4, [Vo])], C, QoS).

go1(Vd, [(QoS, [Vd|T])|_], C, QoS):- reverse([Vd|T], C).

go1(Vd, [(QoS, [H|T])|R], C, QoSsol):- findall((C,[X,H|T]),
	(ve(H,X,N), (N < QoS, C is N; C is QoS)), Novos), append(R, Novos, Todos), go1(Vd, Todos, C, QoSsol).


%	Exercício 3
% Incompleto
caminho_melhor_qos(Va,Vb,C,QoS,Emp):- findall((Q,C1), caminho_qos(Va,Vb,C1,Q), L), maior(L,C,QoS).

maior([], [], 1).

maior([(QoS,[H|T])|T1], C, Q):- maior(T, C, Q), C = [H|T], Q is QoS.