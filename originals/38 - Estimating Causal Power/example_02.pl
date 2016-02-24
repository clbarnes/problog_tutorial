%% causal power of C to cause E (prior)
P::cpw(0) ; P::cpw(0.25) ; P::cpw(0.5) ; P::cpw(0.75) ; P::cpw(1.0) :- P is 1.0/5.
%% background probability of E (prior)
P::bw(0) ; P::bw(0.25) ; P::bw(0.5) ; P::bw(0.75) ; P::bw(1.0) :- P is 1.0/5.

0.5::c(T). % Prior on c. Will not be important because fully observed.

P::e(T) :- cpw(P), c(T).
P::e(T) :- bw(P).

evidence(c(0), true).
evidence(e(0), true).
evidence(e(1), true).
evidence(c(1), true).
evidence(e(2), false).
evidence(c(2), false).
evidence(e(3), true).
evidence(c(3), true).

query(cpw(V)).