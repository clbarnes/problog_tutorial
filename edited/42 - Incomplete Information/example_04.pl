% example from
% Antova, Koch, Olteanu
% Query language support for incomplete information in the MayBMS system
% VLDB 2007
%
% given table:
% SSN TEL
% 123 456
% 789 123
%
% numbers have possibly been swapped (in each tuple), but there is a uniqueness constraint on SSNs -- what are the possible assignments?

0.5::ssn_tel(1,123,456); 0.5::ssn_tel(1,456,123).
0.5::ssn_tel(2,789,123); 0.5::ssn_tel(2,123,789).

wrong :- ssn_tel(1,S,_), ssn_tel(2,S,_).
evidence(wrong,false).

table(S1,T1,S2,T2) :- ssn_tel(1,S1,T1),ssn_tel(2,S2,T2).
query(table(_,_,_,_)).