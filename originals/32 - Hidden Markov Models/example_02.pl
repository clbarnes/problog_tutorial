%%%%%%%%%%
% model
% - start(modelID,state) complete AD
% - trans(modelID,time,fromState,toState) possibly incomplete AD per fromState
% - emit(modelID,time,state,symbol) possibly incomplete AD per state
%%%%%%%%%%

% example 2: ring of five letters, going left or right, emitting letters based on distance
start(letters,a).
0.5::trans(letters,T,M,L); 0.5::trans(letters,T,M,R) :- nbs(_,L,M,R,_).
nbs(a,b,c,d,e).
nbs(b,c,d,e,a).
nbs(c,d,e,a,b).
nbs(d,e,a,b,c).
nbs(e,a,b,c,d).
0.1::emit(letters,T,M,LL); 0.2::emit(letters,T,M,L); 0.4::emit(letters,T,M,M); 0.2::emit(letters,T,M,R); 0.1::emit(letters,T,M,RR) :- nbs(LL,L,M,R,RR).

%%%%%%%%%
% background: which state are we in at which time?
% state(modelID,time,state)
%%%%%%%%%
state(A,0,S) :- start(A,S).
state(A,T,S) :- T > 0, TT is T-1, state(A,TT,S2), trans(A,TT,S2,S).

%%%%%%%%%
% background: which symbol do we see at which time?
% observe(modelID,time,symbol)
%%%%%%%%%
observe(A,T,S) :- state(A,T,State),emit(A,T,State,S).

%%%%%%%%%
% running the model to generate a sequence of labels
% observe_sequence(modelID,list_of_symbols)
%%%%%%%%%
observe_sequence(TS,[First|List]) :-
     start(TS,State),
     emit(TS,0,State,First),
     ob_seq(TS,State,List,0).
% stop
ob_seq(_,_,[],_).
% keep going: add H to output, go to next time and state
ob_seq(TS,State,[H|Tail],Time) :-
     trans(TS,Time,State,State2),
     TT is Time+1,
     emit(TS,TT,State2,H),
     ob_seq(TS,State2,Tail,TT).

%%%%%%%%%
% running the model to generate a sequence of states
% state_sequence(modelID,list_of_states)
%%%%%%%%%
state_sequence(TS,[State|List]) :-
     start(TS,State),
     st_seq(TS,State,List,0).
% stop
st_seq(_,_,[],_).
% keep going: add H to output, go to next time and state
st_seq(TS,State,[State2|Tail],Time) :-
     trans(TS,Time,State,State2),
     TT is Time+1,
     st_seq(TS,State2,Tail,TT).

%%%%%%%%%
% queries
%%%%%%%%%

query(observe_sequence(letters,L)) :- between(0,2,N),length(L,N).
query(state_sequence(letters,L)) :- between(0,2,N),length(L,N).
query(state(letters,T,_)) :- between(0,2,T).
query(observe(letters,T,_)) :- between(0,2,T).