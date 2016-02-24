% Based on Monty Hall problem on http://cplint.lamping.unife.it/example/monty.cpl

1/3::prize(1) ; 1/3::prize(2) ; 1/3::prize(3).

select_door(1).

member(X,[X|T]).
member(X,[H|T]) :- member(X,T).

0.5::open_door(A) ; 0.5::open_door(B) :-
  member(A, [1,2,3]),
  member(B, [1,2,3]),
  A < B,
  \+ prize(A), \+ prize(B),
  \+ select_door(A), \+ select_door(B).

open_door(A) :-
  member(A, [1,2,3]),
  member(B, [1,2,3]),
  \+ prize(A), prize(B),
  \+ select_door(A), \+ select_door(B).

win_keep :-
  select_door(A),
  prize(A).

win_switch :-
  member(A, [1,2,3]),
  \+ select_door(A),
  prize(A),
  \+ open_door(A).

query(prize(_)).
query(select_door(_)).
query(win_keep).
query(win_switch).