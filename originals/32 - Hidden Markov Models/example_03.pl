%%%%%%%%%%
% model
% - start(modelID,state) complete AD
% - trans(modelID,time,fromState,toState) possibly incomplete AD per fromState
% - emit(modelID,time,state,symbol) possibly incomplete AD per state
%%%%%%%%%%

:- use_module(library(lists)).

state(S) :- between(0,14,S).
start(line,S) :- findall(X,state(X),L),select_uniform(init,L,S,_). % start distribution not mentionned in paper, assume uniform

% state s emits 1 with s/14, and 0 else
% i.e., right sink emits 1 and left sink emits 0 for sure
P1::emit(line,T,S,1) ; P2::emit(line,T,S,0) :- P1 is S/14, P2 is 1-P1.

% from intermediate state s, transition upwards with s/14, and downwards else
P::trans(line,T,S,SL) ; PP::trans(line,T,S,SR) :- between(1,13,S), SL is S-1, SR is S+1, PP is S/14, P is 1-PP.
trans(line,_,0,0).
trans(line,_,14,14).

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

evidence(observe(line,0,1)).
evidence(observe(line,1,0)).
evidence(observe(line,2,1)).
query(state(line,T,0)) :- time(T).
query(state(line,T,14)) :- time(T).
time(6).