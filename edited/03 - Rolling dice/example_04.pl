1/6::roll(1,D); 1/6::roll(2,D); 1/6::roll(3,D); 1/6::roll(4,D); 1/6::roll(5,D); 1/6::roll(6,D) :- die(D).
% We can now define any number of fair dice

die(first_die).
die(second_die).

sum(Score) :- roll(Result1,first_die), roll(Result2,second_die), Score is Result1 + Result2.  % You can use arithmetic!
% N.B.: variables used in arithmetic must start with an upper case character
odd(D) :- roll(1,D).
odd(D) :- roll(3,D).
odd(D) :- roll(5,D).
even(D) :- \+ odd(D).

query(sum(_)).

% Evidence written after the query is still taken into account
evidence(even(first_die)).
evidence(odd(second_die)).