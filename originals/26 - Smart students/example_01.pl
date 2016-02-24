0.6::difficult.
0.7::smart.
0.85::success :- difficult, smart.
0.10::success :- difficult, \+smart.
0.98::success :- \+difficult, smart.
0.45::success :- \+difficult, \+smart.
query(difficult).
query(smart).
query(success).