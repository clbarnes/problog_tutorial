%%% model-specific part
% - one ground fact for start/1 giving the starting symbol
% - ground facts for nonterminal/1 listing all nonterminal symbols
% - for each nonterminal, an AD defining its rules, with a shared variable as last argument, where
%    rule(X,Y,Z,_) is a rule X -> Y Z with nonterminals Y and Z
%    rule(X,A,_) is a rule X -> a with terminal "a"
%
% S -> 0.4 :: O M | 0.6 :: S S
% O -> a
% M -> 0.7 :: b | 0.3 :: S C
% C -> b
start(s).
nonterminal(s).
nonterminal(m).
nonterminal(o).
nonterminal(c).
0.4::rule(s,o,m,T); 0.6::rule(s,s,s,T).
rule(o,a,_).
0.7::rule(m,b,T); 0.3::rule(m,s,c,T).
rule(c,b,_).

% we need to fix the length of the list to ensure split/3 has a finite number of solutions
query(word([_,_,_,_])).
query(tree([a,b,a,b,a,b],_)).

%%% model-independent part
% X -> Y Z
parse(W,X,CIn,COut) :-
     get_counter(X,CIn,N),
     rule(X,Y,Z,N),
     increment_counter(X,CIn,CC),
     split(W,W1,W2),
     parse(W1,Y,CC,CCC),
     parse(W2,Z,CCC,COut).
% X -> a
parse([A],X,CIn,COut) :-
     get_counter(X,CIn,N),
     rule(X,A,N),
     increment_counter(X,CIn,COut).

word(W) :-
     findall(X,nonterminal(X),NTs),
     init_counter(NTs,Counter),
     start(S),
     parse(W,S,Counter,_).

% building parse tree
tree(W,T) :-
     findall(X,nonterminal(X),NTs),
     init_counter(NTs,Counter),
     start(S),
     parse_tree(W,S,Counter,_,T).

% X -> Y Z
parse_tree(W,X,CIn,COut,Tree) :-
     Tree =.. [X,Left,Right],
     get_counter(X,CIn,N),
     rule(X,Y,Z,N),
     increment_counter(X,CIn,CC),
     split(W,W1,W2),
     parse_tree(W1,Y,CC,CCC,Left),
     parse_tree(W2,Z,CCC,COut,Right).
% X -> a
parse_tree([A],X,CIn,COut,Tree) :-
     Tree =.. [X,A],
     get_counter(X,CIn,N),
     rule(X,A,N),
     increment_counter(X,CIn,COut).

%%% auxiliaries
% split(+T,-P,-S) splits the (fixed length) list T into two non-empty sublists P(refix) and S(uffix)
% note that T needs to have fixed length for this to terminate
split([A,B|C],[A],[B|C]).
split([A,B|C],[A|D],E) :-
  split([B|C],D,E).

get_counter(X,Cs,N) :-
     member(count(X,N),Cs).

member(A,[A|_]).
member(A,[H|T]) :-
     A \= H,
     member(A,T).

increment_counter(X,[count(X,N)|Cs],[count(X,NN)|Cs]) :-
     NN is N+1.
increment_counter(X,[count(Y,N)|Cs],[count(Y,N)|NCs]) :-
     X \== Y,
     increment_counter(X,Cs,NCs).

init_counter([],[]).
init_counter([H|T],[count(H,0)|C]) :-
     init_counter(T,C).