t(0.5)::topic(t1,D).
t(0.5)::topic(t2,D).

t(_)::word(w1,_,D)   :-   topic(t1,D).
t(0.0)::word(w1,_,D) :- \+topic(t1,D).
t(_)::word(w2,_,D)   :-   topic(t1,D).
t(0.0)::word(w2,_,D) :- \+topic(t1,D).

t(_)::word(w1,_,D)   :-   topic(t2,D).
t(0.0)::word(w1,_,D) :- \+topic(t2,D).
t(_)::word(w2,_,D)   :-   topic(t2,D).
t(0.0)::word(w2,_,D) :- \+topic(t2,D).


evidence(topic(t1,d1), true).
evidence(topic(t2,d1), false).
evidence(word(w1,2,d1),true).
evidence(word(w2,0,d1),false).
evidence(topic(t1,d2), false).
evidence(topic(t2,d2), true).
evidence(word(w1,0,d2),false).
evidence(word(w2,5,d2),true).