% prior on friendship
0.5::friend(S1,S2) :- student(S1),student(S2).
% friendship is (probabilistically) transitive
0.6::should_be_friend(S1,S3) :- friend(S1,S2), friend(S2,S3).

% constraint on acceptable worlds: should_be_friends implies friends
bad_pair :- student(S1), student(S2), should_be_friend(S1,S2), \+ friend(S1,S2).
evidence(bad_pair,false).

query(friend(X,Y)) :- student(X),student(Y), X \= Y.
evidence(friend(s1,s3)).
evidence(friend(s3,s4)).
evidence(friend(s3,s2)).

student(s1).
student(s2).
student(s3).
student(s4).