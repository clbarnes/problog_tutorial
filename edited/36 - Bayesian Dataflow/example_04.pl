% toss both coins for the first time
0.5::c1(0).
0.5::c2(0).

% keep tossing if none was heads
0.5::c1(T) :- T > 0, TT is T-1, \+ or_c1_c2(TT).
0.5::c2(T) :- T > 0, TT is T-1, \+ or_c1_c2(TT).
or_c1_c2(T) :- c1(T).
or_c1_c2(T) :- c2(T).

% return
return(T,1,1) :- or_c1_c2(T), c1(T), c2(T).
return(T,1,0) :- or_c1_c2(T), c1(T), \+ c2(T).
return(T,0,1) :- or_c1_c2(T), \+ c1(T), c2(T).
return(T,0,0) :- or_c1_c2(T),\+c1(T),\+c2(T).

query(return(T,_,_)) :- between(0,5,T).