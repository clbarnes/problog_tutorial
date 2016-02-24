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
0.1::dist(C,B,M,MM2) ; 0.2::dist(C,B,M,MM1) ; 0.4::dist(C,B,M,M) ; 0.2::dist(C,B,M,MP1) ; 0.1::dist(C,B,M,MP2) :- MM2 is M-2, MM1 is M-1, MP1 is M+1, MP2 is M+2.

% directly modeling the rules; note that they all share the same distribution (which is what the paper wants to achieve)
visits(C,B,X) :- client(C,B,L), dist(C,B,L,X).
visits(C,B,X) :- preferred_client(C,B,L), dist(C,B,L,X).
visits(C,B,X) :- client(C,B,L),active(B), dist(C,B,L,X).

query(visits(_,_,_)).

% this is a ProbLog variant of the transformed program in the paper
% that explicitly makes intermediate steps
% 1. define the shared cause for sampling
ex_y_visits_flip(C,B,L) :- client(C,B,L).
ex_y_visits_flip(C,B,L) :- preferred_client(C,B,L).
ex_y_visits_flip(C,B,L) :- client(C,B,L),active(B).
% 2. sample (this is implicit in their translation)
visits_flip(C,B,X,L) :- ex_y_visits_flip(C,B,L), dist(C,B,L,X).
% 3. project out the parameter
visits_hat(C,B,X) :- visits_flip(C,B,X,L).

query(visits_hat(_,_,_)).