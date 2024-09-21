padre(john, peter).
padre(john, mary).

padre(jack, john).

padre(paco, luis).
padre(paco, maria).

padre(maria, clara).
padre(luis, laura).
padre(laura, juan).
padre(juan, augusto).

padre(laura, alberto).
padre(alberto, ana).
padre(alberto, julia).


abuelo(X, Y) :- padre(X, Z), padre(Z, Y).

familiar(X, X).
familiar(X, Y) :- familiar(X, Z), padre(Z, Y).

%familiar(X, Y) :- familiar(Y, X).

primo(X, Y) :- abuelo(Z, X), abuelo(Z, Y).

misma_gen(X, Y) :- padre(Z, X), padre(Z, Y).
misma_gen(X, Y) :- padre(A, X), padre(B, Y), misma_gen(A, B).

