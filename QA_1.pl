livro(1, romance, 'Triunfo dos Porcos', 128).
livro(2, policial, 'Morte no Nilo', 168).
livro(3, ensaio, 'Sentados na Relva', 174).
livro(4, romance, 'Jangada de Pedra', 350).
livro(5, policial, 'Crime no Expresso do Oriente', 288).

autor('Jose Saramago', 4).
autor('George Orewll', 1).
autor('Agatha Christie', 5).
autor('Agatha Christie', 2).
autor('Fernando Namora', 3).

publicacao(A,L):- livro(ID,_,L,_), autor(A,ID).