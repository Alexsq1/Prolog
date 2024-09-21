:- module(_, _, ['bf/bfall']).

inicial(q0).
final(q2).

delta(q0, l, q0).
delta(q0, g, q1).
delta(q1, l, q1).
delta(q1, d, q2).

acepta(Xs) :- inicial(Q), aceptaM(Xs, Q).

aceptaM([], Q) :- final(Q).
aceptaM([X | Xs], Q) :- delta(Q, X, Q2), aceptaM(Xs, Q2).
