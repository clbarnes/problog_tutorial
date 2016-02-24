% example from
% Antova, Koch, Olteanu
% Query language support for incomplete information in the MayBMS system
% VLDB 2007
%
% - 3 whales are seen in three closeby locations a,b,c
% - the one on position a is an adult orca (with identifier 3)
% - the other two are an adult and calf sperm whale (with IDs 2 and 1)
% - there are six possibilities for gender of the adults and positions of the sperm whales

% information shared by all worlds:
species(1,sperm).
gender(1,calf).
species(2,sperm).
species(3,orca).
position(3,a).

% information differing per world, written more compactly
% 4 of 6 worlds have 1 in b and 2 in c
2/3::relpos(b,c); 1/3::relpos(c,b).
position(1,P) :- relpos(P,_).
position(2,P) :- relpos(_,P).

% 3 of 6 worlds have 2 as bull
0.5::gender(2,bull); 0.5::gender(2,cow).
% 2 of the 4 (1,b) worlds have 3 as bull
0.5::gender(3,bull); 0.5::gender(3,cow) :- position(1,b).
% 2 of the 2 (1,c) worlds have 3 as cow
gender(3,cow) :- position(1,c).

% query 1: does the orca attack the calf? (this happens if the calf is at position b)
attack :- position(1,b).
query(attack).

% query 2: same query, but under the constraint that sperm cows move in between their calf and an orca (uncomment evidence to run)
constraint1 :- not (gender(2,cow), not position(2,b)).
%evidence(constraint1).

% query 3: does the adult sperm abandon the calf? (and in which gender combinations does this happen)
abandon(S,O) :- gender(2,S), gender(3,O), position(2,c).
query(abandon(_,_)).