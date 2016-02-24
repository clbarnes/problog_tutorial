% example from
% Antova, Koch, Olteanu
% From complete to incomplete information and back
% SIGMOD 07

% import uniform distributions
:- use_module(library(lists)).

%%%%%%%%%%%%%%
% DATABASE
%%%%%%%%%%%%%%
% two companies & their employees
company_emp(acme, e1).
company_emp(acme, e2).
company_emp(hal, e3).
company_emp(hal, e4).
company_emp(hal, e5).
% employee's skills
emp_skill(e1,web).
emp_skill(e2,web).
emp_skill(e3,java).
emp_skill(e3,web).
emp_skill(e4,sql).
emp_skill(e5,java).

%%%%%%%%%%%%%%
% RANDOM EVENTS
%%%%%%%%%%%%%%%
% we'll buy one of the companies
0.5::buy(acme); 0.5::buy(hal).
% if we buy a company, a random employee will leave that company
leaves(E) :- buy(C), findall(P,company_emp(C,P),List), select_uniform(l(C),List,E,_).

%%%%%%%%%%%%%%
% RULES
%%%%%%%%%%%%%%%
% when do we have an employee with a certain skill?
have_skill(S,C) :- buy(C), company_emp(C,E), \+ leaves(E), emp_skill(E,S).
have_skill(S) :- have_skill(S,_).
% auxiliaries for debugging
world(X,L) :- buy(X), findall(Y,(company_emp(X,Y), \+ leaves(Y)),L).
skillworld(X,L) :- buy(X), findall(S,(company_emp(X,Y), \+ leaves(Y), emp_skill(Y,S)),L).

%%%%%%%%%%%%%%
% QUERIES
%%%%%%%%%%%%%%%
% query 1: if I buy X, which skills do I get? (use commenting to change evidence)
query(have_skill(_)).
% evidence(buy(acme)).
evidence(buy(hal)).

% query 2: which company should I buy to have someone with web skills for sure?
% using meta-reasoning (uncomment query and comment out query and evidence above to run)
buy_skill(C,S) :- company_emp(C,_), emp_skill(_,S), subquery(have_skill(S),Prob,[buy(C)]), Prob =:= 1.0.
%query(buy_skill(_,web)).