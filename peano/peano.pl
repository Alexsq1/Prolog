nat(0).
nat(s(X)) :- nat(X).

le(0, X) :- nat(X).
le(s(X), s(Y)) :- le(X, Y).

add(0, Y, Y) :- nat(Y).
add(s(X), Y, s(Z)) :- add(X, Y, Z).

mul(0, Y, 0) :- nat(Y).
mul(s(X), Y, Z) :- mul(X, Y, W), add(W, Y, Z).

sq(X, Y) :- nat(X), nat(Y), mul(Y, Y, X).

exp(0, _, s(0)).
exp(s(N), X, T) :- exp(N, X, Y), mul(X, Y, T).

fact(0, s(0)).
fact(s(N), F2) :- fact(N, F), mul(F, s(N), F2).

%minimum(N1, N2, Min).
minimum(X, Y, X) :- le(X, Y).
minimum(X, Y, Y) :- le(Y, X).



output(X) :- nat(Y), le(Y,s(s(s(s(s(0)))))),
             sq(Y,X).

%menor(X, Y)
menor(0, s(_)).
menor(s(X), s(Y)) :- menor(X, Y).

