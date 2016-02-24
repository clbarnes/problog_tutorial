counts(C) :- between(0,5,C).
0.0001::word(_,_).

t(_)::topic(t1). % leak probability
t(_)::topic(t1) :- counts(C), word(w1,C).
t(_)::topic(t1) :- counts(C), word(w2,C).

t(_)::topic(t2). % leak probability
t(_)::topic(t2) :- counts(C), word(w1,C).
t(_)::topic(t2) :- counts(C), word(w2,C).


evidence(topic(t1),true).
evidence(topic(t2),false).
evidence(word(w1,2), true).
evidence(word(w2,0), false).
-----
evidence(topic(t1),true).
evidence(topic(t2),false).
evidence(word(w1,1), true).
evidence(word(w2,0), false).
-----
evidence(topic(t1),false).
evidence(topic(t2),true).
evidence(word(w1,0), false).
evidence(word(w2,4), true).
-----
evidence(topic(t1),false).
evidence(topic(t2),true).
evidence(word(w1,4), true).
evidence(word(w2,5), true).
-----