% c is always random
0.5::c(_).

% at t=0, b=1
b(0,1).

% if c is true, enter the loop to toggle b
b(T1,V1) :- T1>0, T is T1-1, b(T,V), c(T), V1 is 1-V.

% if c is false, return current b (we restrict time to max. 20 steps for finite support)
ret(V) :- between(0,20,T), b(T,V), \+c(T).

% what do we return?
query(ret(_)).