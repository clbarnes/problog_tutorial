% the edb from figure 3: different types of properties in cities with different burglary rates
home(np1,napa).
home(np2,napa).
home(yc1,yucaipa).
business(np3,napa).
business(yc1,yucaipa).
city(napa,0.03).
city(yucaipa,0.01).

% ProbLog encoding of rules in figure 1
0.01::earthquake(C,true); 0.99::earthquake(C,false) :- city(C,R).
unit(H,C) :- home(H,C).
unit(B,C) :- business(B,C).
R::burglary(X,C,true) ; RR::burglary(X,C,false) :- unit(X,C), city(C,R), RR is 1-R.
0.6::trig(X,true) ; 0.4::trig(X,false) :- unit(X,C),earthquake(C,true).
0.9::trig(X,true) ; 0.1::trig(X,false) :- burglary(X,C,true).
alarm(X) :- trig(X,true).

query(earthquake(_,_)).
query(burglary(_,_,_)).
query(trig(_,_)).
query(alarm(_)).

% ProbLog encoding of transformed rules in figure 2
exY_earthquake_flip_2(C,y,0.01) :- city(C,R).
unit_hat(H,C) :- home(H,C).
unit_hat(B,C) :- business(B,C).
exY_burglary_flip_3(X,C,y,R) :- unit_hat(X,C),city(C,R).
exY_trig_flip_2(X,y,0.6) :- unit_hat(X,C), earthquake_hat(C,true).
exY_trig_flip_2(X,y,0.9) :- burglary_hat(X,C,true).
alarm_hat(X) :- trig_hat(X,true).
earthquake_hat(C,D) :- earthquake_flip_2(C,D,P).
burglary_hat(X,C,Y) :- burglary_flip_3(X,C,Y,R).
trig_hat(X,Y) :- trig_flip_2(X,Y,P).

P::earthquake_flip_2(C,true,P) ; PP::earthquake_flip_2(C,false,P) :- exY_earthquake_flip_2(C,y,P), PP is 1-P.
R::burglary_flip_3(X,C,true,R); RR::burglary_flip_3(X,C,false,R) :- exY_burglary_flip_3(X,C,y,R), RR is 1-R.
P::trig_flip_2(X,true,P) ; PP::trig_flip_2(X,false,P) :- exY_trig_flip_2(X,y,P), PP is 1-P.

query(earthquake_hat(_,_)).
query(burglary_hat(_,_,_)).
query(trig_hat(_,_)).
query(alarm_hat(_)).