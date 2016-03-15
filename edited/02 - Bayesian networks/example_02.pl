0.7::burglary.
0.2::earthquake.

% Some syntactic sugar - we don't have to use our Facts syntax just to store variables used in Rules
0.9::alarm :- burglary, earthquake.
0.8::alarm :- burglary, \+earthquake.
0.1::alarm :- \+burglary, earthquake.

evidence(alarm,true).
query(burglary).
query(earthquake).