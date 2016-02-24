% model part from the agree.psm example in Sato's PRISM distribution http://rjida.meijo-u.ac.jp/prism/
% adapted to ProbLog

0.8::msw(coin(a),heads); 0.2::msw(coin(a),tails).
0.1::msw(coin(b),heads); 0.9::msw(coin(b),tails).

failure :- not(success).        % failure is defined as not(success).
success :- agree(_).            % success <=> exist([X],agree(X))

agree(A):-                      % flip two coins and
  msw(coin(a),A),              % output the result only when
  msw(coin(b),B),              % both outcomes agree.
  A=B.

query(msw(_,_)).
evidence(success).