% model part from the hmm.psm example in Sato's PRISM distribution http://rjida.meijo-u.ac.jp/prism/
% adapted to ProbLog, with arbitrary probabilities added

0.5::msw(init,s0); 0.5::msw(init,s1).     % state initialization
% ProbLog needs extra argument to avoid reusing previous values
0.7::msw(out(X),Y,a); 0.3::msw(out(X),Y,b).      % symbol emission
0.4::msw(tr(X),Y,s0); 0.6::msw(tr(X),Y,s1).    % state transition

hmm(L):-                        % To observe a string L:
  str_length(N),               %   Get the string length as N
  msw(init,S),                 %   Choose an initial state randomly
  hmm(1,N,S,L).                %   Start stochastic transition (loop)

% ProbLog does not support cut (!) to stop at basecase, so we add check to recursive clause instead
hmm(T,N,_,[]):- T>N.          % Stop the loop
hmm(T,N,S,[Ob|Y]) :-          % Loop: current state is S, current time is T
  T =< N,
  msw(out(S),T,Ob),          %   Output Ob at the state S using T to avoid reuse
  msw(tr(S),T,Next),         %   Transit from S to Next using T to avoid reuse
  T1 is T+1,                 %   Count up time
  hmm(T1,N,Next,Y).          %   Go next (recursion)

str_length(4).                % String length

query(hmm(_)).