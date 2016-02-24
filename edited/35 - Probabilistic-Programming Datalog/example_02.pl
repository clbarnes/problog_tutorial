% input relations (filled arbitrarily)
% client(id, branch, avg_num_of_visits)
client(a,b1,2).
client(b,b2,2).
client(c,b2,3).
% preferred_client(id, branch, avg_num_of_visits)
preferred_client(a,b1,2).
preferred_client(b,b2,2).
% active(branch)
active(b1).

% fixed distribution centered around the average M (assumes M >=2)
0.1::basic(C,B,M,MM2) ; 0.2::basic(C,B,M,MM1) ; 0.4::basic(C,B,M,M) ; 0.2::basic(C,B,M,MP1) ; 0.1::basic(C,B,M,MP2) :- MM2 is M-2, MM1 is M-1, MP1 is M+1, MP2 is M+2.
0.1::pref(C,B,M,MM2) ; 0.2::pref(C,B,M,MM1) ; 0.4::pref(C,B,M,M) ; 0.2::pref(C,B,M,MP1) ; 0.1::pref(C,B,M,MP2) :- MM2 is M-2, MM1 is M-1, MP1 is M+1, MP2 is M+2.
0.1::active(C,B,M,MM2) ; 0.2::active(C,B,M,MM1) ; 0.4::active(C,B,M,M) ; 0.2::active(C,B,M,MP1) ; 0.1::active(C,B,M,MP2) :- MM2 is M-2, MM1 is M-1, MP1 is M+1, MP2 is M+2.

% directly modeling the rules; note that they all share the same distribution (which is what the paper wants to achieve)
visits(C,B,X) :- client(C,B,L), basic(C,B,L,X).
visits(C,B,X) :- preferred_client(C,B,L), pref(C,B,L,X).
visits(C,B,X) :- client(C,B,L),active(B), active(C,B,L,X).

query(visits(_,_,_)).