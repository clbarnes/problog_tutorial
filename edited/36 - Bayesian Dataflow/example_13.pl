0.5::coin(T,true); 0.5::coin(T,false).

b(0,false).
b(T,V) :- T>0, TT is T-1, b(TT,false), coin(T,V).

query(b(X,true)) :- between(1,5,X).