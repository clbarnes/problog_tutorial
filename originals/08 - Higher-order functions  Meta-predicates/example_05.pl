PH::make_coin(C,PH).
coin(C) :- make_coin(C,0.8).
coins_r(SC,SC,0).
coins_r(SC,S,CNT) :-
    CNT > 0,
    (coin(CNT),
     SC2 is SC+1;
     \+coin(CNT),
     SC2 is SC),
    CNT2 is CNT-1,
    coins_r(SC2,S,CNT2).
total(S) :- coins_r(0,S,10).

query(total(_)).