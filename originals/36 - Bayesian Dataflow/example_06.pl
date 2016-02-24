0.5::bit(T,0); 0.5::bit(T,1).

% base cases: return the current bit if it equals the truth value of 2*p>=1.0
step(T,D,P,1) :-
     T =< D,
     2*P >= 1.0,
     bit(T,1).
step(T,D,P,0) :-
     T =< D,
     2*P < 1.0,
     bit(T,0).
% recursive cases: else, continue with the fractional part of 2*p as new value of p
step(T,D,P,V) :-
     T =< D,
     2*P >= 1.0,
     bit(T,0),
     TT is T+1,
     PP is float_fractional_part(2*P),
     step(TT,D,PP,V).
step(T,D,P,V) :-
     T =< D,
     2*P < 1.0,
     bit(T,1),
     TT is T+1,
     PP is float_fractional_part(2*P),
     step(TT,D,PP,V).

coin(P,D,V) :-
     step(1,D,P,V).

query(coin(0.12,D,_)) :- digits(D).
query(coin(0.7,D,_)) :- digits(D).
digits(20).