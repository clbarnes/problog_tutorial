0.5::throws(suzy).
throws(billy).

0.8::broken; 0.2::miss :- throws(suzy).
0.6::broken; 0.4::miss :- throws(billy).

query(broken).