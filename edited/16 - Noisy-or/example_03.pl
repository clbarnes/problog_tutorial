t(_)::topic(t1). % leak probability
t(_)::topic(t1) :- word(w1,_).
t(_)::topic(t1) :- word(w2,_).

t(_)::topic(t2). % leak probability
t(_)::topic(t2) :- word(w1,_).
t(_)::topic(t2) :- word(w2,_).

% Leak probabilities
0.0001::word(w1,0).
0.0001::word(w1,1).
0.0001::word(w1,2).
0.0001::word(w1,4).
0.0001::word(w2,0).
0.0001::word(w2,4).
0.0001::word(w2,5).


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