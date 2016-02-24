%%%%%%%%%%
% model
% - start(modelID,state) complete AD
% - trans(modelID,time,fromState,toState) possibly incomplete AD per fromState
% - emit(modelID,time,state,symbol) possibly incomplete AD per state
%%%%%%%%%%

% example 1: weather (with umbrella yes/no added)
0.5::start(weather,sun); 0.5::start(weather,rain).
0.6::trans(weather,T,sun,sun); 0.4::trans(weather,T,sun,rain).
0.2::trans(weather,T,rain,sun); 0.8::trans(weather,T,rain,rain).
0.9::emit(weather,T,sun,no); 0.1::emit(weather,T,sun,yes).
0.1::emit(weather,T,rain,no); 0.9::emit(weather,T,rain,yes).

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

query(observe_sequence(weather,L)) :- between(0,2,N),length(L,N).
query(state_sequence(weather,L)) :- between(0,2,N),length(L,N).
query(state(weather,T,_)) :- between(0,2,T).
query(observe(weather,T,_)) :- between(0,2,T).