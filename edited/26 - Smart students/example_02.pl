0.6::difficult(C) :- course(C).
course(C) :- takes(_,C).
0.7::smart(S) :- student(S).
student(S) :- takes(S,_).
0.85::success(S,C) :- takes(S,C),difficult(C), smart(S).
0.10::success(S,C) :- takes(S,C),difficult(C), \+smart(S).
0.98::success(S,C) :- takes(S,C),\+difficult(C), smart(S).
0.45::success(S,C) :- takes(S,C),\+difficult(C), \+smart(S).

takes(s1,c1).
takes(s1,c2).
takes(s2,c1).
takes(s2,c2).
takes(s3,c2).
takes(s3,c4).

query(difficult(_)).
query(smart(_)).
query(success(_,_)).

evidence(difficult(c2)).
evidence(success(s1,c2)).