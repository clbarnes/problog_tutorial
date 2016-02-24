throwAt(mary,firstbottle).

0.3::broken(B); 0.7::miss :- throwAt(P,B).

query(broken(_)).
query(miss).