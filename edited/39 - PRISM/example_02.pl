% model part from the dcoin.psm example in Sato's PRISM distribution http://rjida.meijo-u.ac.jp/prism/
% adapted to ProbLog

% as coins are used repeatedly, ProbLog needs extra identifier
0.5::msw(coin(1),ID,head); 0.5::msw(coin(1),ID,tail).
0.7::msw(coin(2),ID,head); 0.3::msw(coin(2),ID,tail).

dcoin(N,Rs) :-                  % Rs is a list with length N of outcomes
  dcoin(N,coin(1),Rs).         % from two Bernoulli trials processes.

dcoin(N,Coin,[R|Rs]) :-
  N > 0,
  msw(Coin,N,R),   % replace N by some constant here to see the difference
  ( R == head, NextCoin = coin(2)
  ; R == tail, NextCoin = coin(1) ),
  N1 is N-1,
  dcoin(N1,NextCoin,Rs).
dcoin(0,_,[]).

query(dcoin(4,_)).