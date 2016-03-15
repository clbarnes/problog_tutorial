% Probabilistic facts

0.7::burglary.
0.2::earthquake.
0.9::p_alarm1.  % probability of the alarm going off in one set of circumstances (see rules)
0.8::p_alarm2.
0.1::p_alarm3.

% Rules
alarm :- burglary, earthquake, p_alarm1.
alarm :- burglary, \+earthquake, p_alarm2.  % '\+' indicates negation (NOT)
alarm :- \+burglary, earthquake, p_alarm3.
% Stating multiple rules with the same left hand side shows disjunction (OR) - all the different circumstances where alarm is true

% Evidence
evidence(alarm,true).  % we observe that the alarm has gone off - this will affect our inference about the queries!

% Queries
query(burglary).  % Pr( burglary | alarm=true )
query(earthquake).