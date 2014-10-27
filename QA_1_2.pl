homem(joao, 43, 'Vila Real').
homem(pedro, 31, 'Porto').
homem(rui, 25, 'Caldas de Aregos').
homem(emanuel, 14, 'Venda de Raparigas').

mulher(teresa, 25, 'Porto').
mulher(maria, 33, 'Porto').
mulher(sofia, 13, 'Cinfaes do Douro').

select(Pessoa, Local, Max):- (homem(Pessoa, Idade, Local); mulher(Pessoa, Idade, Local)), Idade < Max.