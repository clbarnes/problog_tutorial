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

% information differing per world
position(1,b) :- world(a).
position(2,c) :- world(a).
gender(2,cow) :- world(a).
gender(3,cow) :- world(a).

position(1,b) :- world(b).
position(2,c) :- world(b).
gender(2,cow) :- world(b).
gender(3,bull) :- world(b).

position(1,b) :- world(c).
position(2,c) :- world(c).
gender(2,bull) :- world(c).
gender(3,cow) :- world(c).

position(1,b) :- world(d).
position(2,c) :- world(d).
gender(2,bull) :- world(d).
gender(3,bull) :- world(d).

position(1,c) :- world(e).
position(2,b) :- world(e).
gender(2,cow) :- world(e).
gender(3,cow) :- world(e).

position(1,c) :- world(f).
position(2,b) :- world(f).
gender(2,bull) :- world(f).
gender(3,cow) :- world(f).

% assume uniform dist over worlds (this is not in the original paper)
1/6::world(a); 1/6::world(b); 1/6::world(c); 1/6::world(d); 1/6::world(e); 1/6::world(f).

% query 1: does the orca attack the calf? (this happens if the calf is at position b)
attack :- position(1,b).
query(attack).

% query 2: same query, but under the constraint that sperm cows move in between their calf and an orca (uncomment evidence to run)
constraint1 :- not (gender(2,cow), not position(2,b)).
%evidence(constraint1).

% query 3: does the adult sperm abandon the calf? (and in which gender combinations does this happen)
abandon(S,O) :- gender(2,S), gender(3,O), position(2,c).
query(abandon(_,_)).