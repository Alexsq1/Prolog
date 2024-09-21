inicial(q0).
final(q1).

%delta(q0, S, P0, q1, P1)
delta(q0, X, Xs, q0, [X | Xs]).
delta(q0, X, [X | Xs], q1, Xs).
delta(q1, X, [X | Xs], q1, Xs).


acepta(S) :- aceptaM(S, Q, []), inicial(Q).

aceptaM([], Q, []) :- final(Q).
aceptaM([X | Xs], Q, P) :- aceptaM(Xs, Q2, P2), delta(Q, X, P, Q2, P2).
