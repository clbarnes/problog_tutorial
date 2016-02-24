% model part from the direction.psm example in Sato's PRISM distribution http://rjida.meijo-u.ac.jp/prism/
% adapted to ProbLog, with arbitrary probabilities added

0.6::msw(coin,head); 0.4::msw(coin,tail).

% ProbLog does not support if-then-else with ->, so we untangle
direction(left) :- msw(coin,head).
direction(right) :- msw(coin,tail).

query(direction(_)).