is_topic(t1). is_topic(t2).
is_word(w1). is_word(w2).

t(_,T)::topic(T).
t(_,W,T)::word(W) :- is_topic(T), is_word(W),   topic(T).
t(_,W,T)::word(W) :- is_topic(T), is_word(W), \+topic(T).


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