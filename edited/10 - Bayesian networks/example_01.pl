%%% The program:
t(0.5)::burglary.
0.2::earthquake.
t(_)::p_alarm1.
t(_)::p_alarm2.
t(_)::p_alarm3.

alarm :- burglary, earthquake, p_alarm1.
alarm :- burglary, \+earthquake, p_alarm2.
alarm :- \+burglary, earthquake, p_alarm3.



%%% The data:
evidence(burglary,false).
evidence(alarm,false).
-----
evidence(earthquake,false).
evidence(alarm,true).
evidence(burglary,true).
-----
evidence(burglary,false).