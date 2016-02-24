0.7::leaf(T).
0.5::operator('+',T) ; 0.5::operator('-',T).

Px::l(x,T); P::l(0,T); P::l(1,T); P::l(2,T); P::l(3,T); P::l(4,T); P::l(5,T); P::l(6,T); P::l(7,T); P::l(8,T); P::l(9,T) :- Px = 0.5, P is (1-Px)/10.

expr(A) :- expr(A,1,R).

expr(L,T1,T2) :- leaf(T1), T2 is T1+1, l(L,T1).
expr(S,T1,T2) :-
   \+ leaf(T1),
   Ta is T1+1,
   expr(E1,Ta,Tb),
   expr(E2,Tb,T2),
   operator(Operator,Ta),
   S =.. [Operator,E1,E2].

query(expr(A)).