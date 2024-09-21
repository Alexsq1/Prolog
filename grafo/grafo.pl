:- module(_, _, ['bf/bfall']).

arista(1, 2).
arista(2, 3).
arista(2, 9).
arista(3, 4).
arista(4, 5).
arista(5, 1).
arista(3, 6).
arista(6, 7).
arista(7, 8).

arista(9, 8).
arista(10, 1).


camino(X, Y, [X, Y]) :- arista(X, Y).
camino(X, Y, [X | Xs]) :- arista(X, Z), camino(Z, Y, Xs).

circuito(X, L) :- camino(X, X, L).
