PH::coin(C,PH,h); PT::coin(C,PH,t) :- PT is 1.0-PH.
fair_coin(C,R) :- make_coin(0.5, R).
bend(Coin, R) :- call(Coin, R2), (R2=h, coin(C,0.7,R); R2=t, coin(C,0.1,R)).
bent_coin(R) :- bend(fair_coin, R).

query(bent_coin(_)).