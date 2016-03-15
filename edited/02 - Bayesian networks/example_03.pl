% Properties (a type of Fact)
person(john).  % There is a property 'person', and one person we know of is 'john'
person(mary).

% Facts
0.7::burglary.
0.2::earthquake.

% Rules
0.9::alarm :- burglary, earthquake.
0.8::alarm :- burglary, \+earthquake.
0.1::alarm :- \+burglary, earthquake.

0.8::calls(X) :- alarm, person(X).  % The probability of X calling, given the value of 'alarm' and that X is a person
0.1::calls(X) :- \+alarm, person(X).
% In this case, neither person is more likely to call than the other given any alarm state
% If, for example, John enjoyed prank calls, you might see
% 0.5::calls(john) :- \+alarm

% Evidence
evidence(calls(john),true).  % john has called
evidence(calls(mary),true).

% Queries
query(burglary).
query(earthquake).