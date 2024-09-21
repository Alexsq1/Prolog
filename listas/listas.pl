nat(0).
nat(s(X)) :- nat(X).

add(0, Y, Y) :- nat(Y).
add(s(X), Y, s(Z)) :- add(X, Y, Z).


list([]).
list([_|Y]) :- list(Y).

member(X, [X | _]).
member(X, [_ | T]) :- member(X, [T]).

len([], 0).
len([_ | T], s(X)) :- len(T, X).

sumlist([], 0).
sumlist([H | T], Z) :- sumlist(T, X), add(H, X, Z).

%prefix([prefijo], [listaorig])
prefix([H | T], [H | T2]) :- prefix(T, T2). 
prefix([], _).

%prefix([prefijo], [listaorig])
eqlist([H | T], [H | T2]) :- eqlist(T, T2). 
eqlist([], []).

%sublist([], _).
%sublist(X, [Y | T2]) :- sublist(X, T2).
%sublist([X | T1], [X | T2]) :- sublist(T1, T2).

%append ([X|Xs],Ys ,[X|Zs]) :- append (Xs ,Ys ,Zs).
concat([], Ys, Ys) :- list(Ys).
concat([H | Xs], L, [H | Z]) :- concat(Xs, L, Z).

preffix_with_concat(L1, L2) :- concat(L1, _, L2).
suffix_with_concat(L1, L2) :- concat(_, L1, L2).
sublist_with_concat(L1, L2) :- concat(_, L1, X), concat(X, _, L2). 

reverse([], []).
reverse([H | X], Z), concat(Y, X, Z) :- reverse(X, Y).

%reverse ([],Ys ,Ys).
%reverse ([X|Xs],Acc ,Ys) :- reverse (Xs ,[X|Acc],Ys).

rev_tail(X, Y) :- rev_tail(X, [], Y).
rev_tail([], Ys, Ys). %Devolver la lista revertida acumulada a Y, solución
rev_tail([X | Xs], Acc, Ys) :- rev_tail(Xs, [X | Acc], Ys).
