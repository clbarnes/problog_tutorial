0.5::pick(N, a) ; 0.5::pick(N,b).

% a palindrome of length N spans positions 1 to N
palindrome(N) :-
      palindrome(1,N).

% base case for even length: left and right crossed
palindrome(A,B) :-
      A > B.
% base case for uneven length: arbitrary middle character
palindrome(N,N) :-
      pick(N,_).
% recursive case: add same character at both ends and move positions towards the middle
palindrome(A,B) :-
      A < B,
      pick(A,X),
      pick(B,X),
      AA is A+1,
      BB is B-1,
      palindrome(AA,BB).

bb(N) :-
      Max is N-1,
      between(1,Max,I),
      pick(I,b),
      II is I+1,
      pick(II,b).

len(5).
evidence(palindrome(X)) :- len(X).
query(bb(X)) :- len(X).