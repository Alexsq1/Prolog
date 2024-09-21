
%hanoi(N, M)

hanoi_movs(N, M) :- hanoi(N, a, b, c, M).

hanoi(s(0), Orig, _Help, Dest, [move(Orig, Dest)]).
hanoi(s(N), Orig, Help, Dest, Xs) :- 
    hanoi(N, Orig, Dest, Help, As), 
    hanoi(N, Help, Orig, Dest, Cs),
    append(As, [move(Orig, Dest) | Cs], Xs).


append3(Xs, Ys, Zs, Ts) :- mappend(Xs, Ys, Aux), mappend(Aux, Zs, Ts).
