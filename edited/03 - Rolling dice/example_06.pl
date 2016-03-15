% The first die, which will always be rolled
1/6::roll(1,1); 1/6::roll(2,1); 1/6::roll(3,1); 1/6::roll(4,1); 1/6::roll(5,1); 1/6::roll(6,1).

% Subsequent dice...
1/6::roll(1,D); 1/6::roll(2,D); 1/6::roll(3,D); 1/6::roll(4,D); 1/6::roll(5,D); 1/6::roll(6,D) :- D > 1, P is D-1, continue(P).
% Only the case if D > 1 (i.e. after the first roll has taken place) and if the previous roll P (D-1) resulted in a continue

stop(N) :- roll(6,N).  % stop on roll N is true if the result of roll N is 6
continue(N) :- roll(X,N), X < 6.  % continue on roll N if the result of roll N is X, where X is less than 6

query(stop(N)) :- between(1,5,N).  % 'between' is a built-in function: this queries whether you stop on a value of N between 1 and 5

% closed form probability computation
%query(s(X)) :- between(1,5,X).
%P::s(N) :- P is 1/6*(5/6)**(N-1).