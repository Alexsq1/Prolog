:- module(_,_,[]).

nat(0).
nat(s(X)) :- nat(X).

par(0).
par(s(s(X))) :- par(X).


fact(0, 1).
fact(N, F) :-
    integer(N),
    N > 0,
    Npre is N - 1,
    fact(Npre, Fpre),
    F is Fpre * N.

plus(X,Y,Z) :- number(X), number(Y), Z is X + Y.
plus(X,Y,Z) :- number(X), number(Z), Y is Z - X.
plus(X,Y,Z) :- number(Z), number(Y), X is Z - Y.

add_arrays(A, B, C) :- 
    functor(A, array, N), functor(B, array, N), functor(C, array, N),
    add_elements(A, B, C, N).

add_elements(A, B, C, I) :- 
    I > 0,
    arg(I, A, X), arg(I, B, Y), Z is X + Y, arg(I, C, Z),
    I2 is I - 1, add_elements(A, B, C, I2).

add_elements(_, _, _, 0).

%add_lists(Xs, Ys, Zs)

add_lists([], [], []).
add_lists([X | Xs], [Y | Ys], [Z | Zs]) :- 
    Z is X + Y, add_lists(Xs, Ys, Zs).

%subterm(Subterm, Term):

subterm(T, T).
subterm(S, T) :-

    functor(T, _, Aridad),
    n_to_one(Aridad, X),
    arg(X, T, S2),
    subterm(S, S2).


n_to_one(N, N) :- N > 0.
n_to_one(N, X) :- N > 1, N1 is N-1, n_to_one(N1 , X).

likes(bill , cider ).
likes(dick , beer).
likes(tom , beer).
likes(tom , beer).
likes(tom , cider ).
likes(harry , beer).
likes(jan , cider ).

max(X, Y, X) :- X > Y, !.
max(_, Y, Y).

