%% PROXIMITY EQUATIONS
0.5::equals(does_not, a_little).
0.2::equals(a_little, very_much).
0.1::equals(does_not, so_much).
0.6::equals(so_much, very_much).
0.5::equals(a_little, so_much).

%% FACTS
likes(john, whiskey, a_little).
likes(mary, whiskey, very_much).
likes(peter, whiskey, so_much).
likes(paul, whiskey, does_not).

%% RULES
equals(X,X).
equals(X,Y) :- equals(Y,X).

buy(X,P) :- likes(X, P, L), equals(L, very_much).

%% QUERY
query(buy(X, whiskey)).