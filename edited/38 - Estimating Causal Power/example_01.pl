%% causal power of C to cause E (prior)
P::cpw(0) ; P::cpw(0.25) ; P::cpw(0.5) ; P::cpw(0.75) ; P::cpw(1.0) :- P is 1.0/5.
%% background probability of E (prior)
P::bw(0) ; P::bw(0.25) ; P::bw(0.5) ; P::bw(0.75) ; P::bw(1.0) :- P is 1.0/5.

%P::cp(T) :- cpw(P).
%P::b(T) :- bw(P).
%e_if_c(C,T) :- cp(T), C=true.
%e_if_c(C,T) :- b(T).

P::e_if_c(C,T) :- cpw(P), C=true.
P::e_if_c(C,T) :- bw(P).

evidence(e_if_c(true,0),  true).
evidence(e_if_c(true,1),  true).
evidence(e_if_c(false,2), false).
evidence(e_if_c(true,3),  true).

query(cpw(V)).