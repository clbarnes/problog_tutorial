t(0.5)::topic(t1); t(0.5)::topic(t2).

t(_)::word(w1) :- topic(t1).
t(_)::word(w1) :- topic(t2).
t(_)::word(w2) :- topic(t1).
t(_)::word(w2) :- topic(t2).


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