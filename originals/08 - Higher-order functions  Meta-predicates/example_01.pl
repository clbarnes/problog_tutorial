PH::coin(C,h,PH); PT::coin(C,t,PH) :- PT is 1.0-PH.
fair_coin(C,S)  :- coin(C,S,0.5).
trick_coin(C,S) :- coin(C,S,0.95).
bent_coin(C,S)  :- coin(C,S,0.25).

query(fair_coin(c1,_)).
query(trick_coin(c2,_)).
query(bent_coin(c3,_)).