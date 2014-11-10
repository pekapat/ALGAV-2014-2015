p3(L,LI):- p3(L,[],LI).
p3([],LI,LI).
p3([H|T],L,LI):- \+number(H), !, p3(T ,[H|L],LI).
p3([_|T],L,LI):- p3(T,L,LI).

p4(L,I,F,SL):- p4(L,I,1,F,SL).

p4([],_,_,_,[]).
p4([H|T],I,P,F,[H|SL]):- I =< P, F >= P, P1 is P + 1, !, p4(T,I,P1,F,SL).
p4([_|T],I,P,F,SL):- P1 is P + 1, p4(T,I,P1,F,SL).

