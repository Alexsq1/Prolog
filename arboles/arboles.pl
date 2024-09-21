list([]).
list([_|Y]) :- list(Y).

member_list(X, [X | _]).
member_list(X, [_ | Xs]) :- member_list(X, Xs).

concat([], Ys, Ys) :- list(Ys).
concat([H | Xs], L, [H | Z]) :- concat(Xs, L, Z).


binary_tree(void).
binary_tree(tree(_E, L, R)) :- binary_tree(L), binary_tree(R).


%tree(1, tree(2, tree(4, void, void), tree(5, void, void)), tree(3, void, tree(6, void, void)))
%tree(1, tree(2, tree(4, tree(8, void, void), tree(9, void, void)), tree(5, tree(10, void, void), tree(11, void, void))), tree(3, tree(6, tree(12, void, void), tree(13, void, void)), tree(7, tree(14, void, void), tree(15, void, void))))

tree_member(X, tree(X, L, R)) :- binary_tree(L), binary_tree(R).
tree_member(X, tree(_, L, _)) :- tree_member(X, L).
tree_member(X, tree(_, _, R)) :- tree_member(X, R).

preorder(void, []).
preorder(tree(X, L, R), [X | Xs]) :- preorder(L, Xs1), preorder(R, Xs2), concat(Xs1, Xs2, Xs). 

inorder(void, []).
inorder(tree(X, L, R), Xs) :- inorder(L, Xs1), inorder(R, Xs2), concat(Xs1, [X | Xs2], Xs).

postorder(void, []).
postorder(tree(X, L, R), Xs) :- postorder(L, Xs1), postorder(R, Xs2), concat(Xs1, Xs2, Xpre), concat(Xpre, [X], Xs).