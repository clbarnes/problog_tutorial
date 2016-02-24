1/6::dice(1,1); 1/6::dice(2,1); 1/6::dice(3,1); 1/6::dice(4,1); 1/6::dice(5,1); 1/6::dice(6,1).
1/6::dice(1,D); 1/6::dice(2,D); 1/6::dice(3,D); 1/6::dice(4,D); 1/6::dice(5,D); 1/6::dice(6,D) :- D > 1, P is D-1, continue(P).

stop(N) :- dice(6,N).
continue(N) :- dice(X,N), X < 6.

query(stop(N)) :- between(1,5,N).

% closed form probability computation
%query(s(X)) :- between(1,5,X).
%P::s(N) :- P is 1/6*(5/6)**(N-1).