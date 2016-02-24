% model part from the chmm.psm example in Sato's PRISM distribution http://rjida.meijo-u.ac.jp/prism/
% adapted to ProbLog

% add time argument to avoid reuse
0.7::msw(tr(s0),T,s0); 0.3::msw(tr(s0),T,s1).
0.7::msw(tr(s1),T,s1); 0.3::msw(tr(s1),T,s0).

0.4::msw(lunch(s0),T,p) ; 0.6::msw(lunch(s0),T,s). % pizza:900, sandwich:400
0.5::msw(lunch(s1),T,h) ; 0.5::msw(lunch(s1),T,s). % hanburger:400, sandwich:500

failure:- not(success).
success:- success(_).
success(L):- chmm(L,s0,0,3).
failure(L):- not(success(L)).

chmm(L,S,C,N):-
  N>0,
  msw(tr(S),N,S2),
  msw(lunch(S),N,D),
  ( S == s0,
    ( D = p, C2 is C+900
    ; D = s, C2 is C+400 )
  ; S == s1,
    ( D = h, C2 is C+400
    ; D = s, C2 is C+500 )
  ),
  L=[D|L2],
  N2 is N-1,
  chmm(L2,S2,C2,N2).

chmm([],_,C,0):- C < 2000.

% given that the total number of calories in 3 days is below 2000, what was the choice of menu?
query(success(_)).
evidence(failure,false).