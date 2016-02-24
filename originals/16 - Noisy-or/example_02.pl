0.0001::word(_).

t(_)::topic(t1). % leak probability
t(_)::topic(t1) :-   word(w1).
t(_)::topic(t1) :- \+word(w1).
t(_)::topic(t1) :-   word(w2).
t(_)::topic(t1) :- \+word(w2).

t(_)::topic(t2). % leak probability
t(_)::topic(t2) :-   word(w1).
t(_)::topic(t2) :- \+word(w1).
t(_)::topic(t2) :-   word(w2).
t(_)::topic(t2) :- \+word(w2).


evidence(topic(t1),true).
evidence(topic(t2),false).
evidence(word(w1), true).
evidence(word(w2), false).
-----
evidence(topic(t1),true).
evidence(topic(t2),false).
evidence(word(w1), true).
evidence(word(w2), false).
-----
evidence(topic(t1),false).
evidence(topic(t2),true).
evidence(word(w1), false).
evidence(word(w2), true).
-----
evidence(topic(t1),false).
evidence(topic(t2),true).
evidence(word(w1), true).
evidence(word(w2), true).
-----