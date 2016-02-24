% uniform prior on students liking teachers
0.5::likes(S,T) :- student(S),teacher(T).

% if S takes T's course, S should like T
0.7::should_like(S,T) :- student_course(S,C),teacher_course(T,C).

% constraint on acceptable worlds: should_like implies like
bad_pair :- should_like(S,T), \+ likes(S,T).
evidence(bad_pair,false).

% posterior of likes?
query(likes(S,T)).

teacher(t1).
teacher(t2).
teacher(t3).

student(s1).
student(s2).
student(s3).

teacher_course(t1,c4).
teacher_course(t2,c1).
teacher_course(t2,c2).
teacher_course(t3,c3).

student_course(s1,c1).
student_course(s2,c1).
student_course(s2,c2).
student_course(s3,c2).
student_course(s3,c4).