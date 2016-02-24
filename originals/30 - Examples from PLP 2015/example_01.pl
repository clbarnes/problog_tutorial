0.5::pick(N, a) ; 0.5::pick(N,b).

random_string(0,[]).
random_string(N,[X|L]) :-
     N > 0,
     pick(N,X),
     NN is N-1,
     random_string(NN,L).

palindrome(L) :- reverse(L,L).

reverse(L,R) :-
     reverse(L,[],R).
reverse([],L,L).
reverse([A|B],S,R) :-
     reverse(B,[A|S],R).

twoBs([b,b|_]).
twoBs([_|L]) :-
     twoBs(L).

string_is_palindrome(N) :- string_is_palindrome(N,_).
string_is_palindrome(N,L) :- random_string(N,L),palindrome(L).

string_with_bb(N) :- string_with_bb(N,_).
string_with_bb(N,L) :- random_string(N,L),twoBs(L).

len(5).
evidence(string_is_palindrome(X)) :- len(X).
query(string_with_bb(X)) :- len(X).