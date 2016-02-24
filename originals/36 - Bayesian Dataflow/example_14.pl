0.5::roll(ID,T,true); 0.5::roll(ID,T,false).

% start with all three false
dice(0,false,false,false).
% while all three are false or all three are true, continue
dice(N,A,B,C) :- N > 0, NN is N-1, dice(NN,X,X,X), roll(d1,N,A), roll(d2,N,B), roll(d3,N,C).
% and stop if not
dice_return(NN,A,B,C) :- NN >= 0, dice(NN,A,B,C), \+ allsame(A,B,C).

allsame(X,X,X).

query(dice_return(X,_,_,_)) :- between(1,3,X).