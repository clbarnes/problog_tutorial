% model part from the alarm.psm example in Sato's PRISM distribution http://rjida.meijo-u.ac.jp/prism/
% adapted to ProbLog

% switches defining CPTs
0.1::msw(fi,yes); 0.9::msw(fi,no).
0.15::msw(ta,yes); 0.85::msw(ta,no).
0.95::msw(sm(yes),yes); 0.05::msw(sm(yes),no).
0.05::msw(sm(no),yes); 0.95::msw(sm(no),no).
0.5::msw(al(yes,yes),yes); 0.5::msw(al(yes,yes),no).
0.9::msw(al(yes,no),yes); 0.1::msw(al(yes,no),no).
0.85::msw(al(no,yes),yes); 0.15::msw(al(no,yes),no).
0.05::msw(al(no,no),yes); 0.95::msw(al(no,no),no).
0.88::msw(le(yes),yes); 0.12::msw(le(yes),no).
0.01::msw(le(no),yes); 0.99::msw(le(no),no).
0.75::msw(re(yes),yes); 0.25::msw(re(yes),no).
0.1::msw(re(no),yes); 0.9::msw(re(no),no).

% unchanged from PRISM
world(Fi,Ta,Al,Sm,Le,Re) :-
   %% Define a distribution for world/5 such that e.g.
   %%    P(Fire=yes,Tapering=yes,Smoke=no,Alarm=no,Leaving=no,Report=no)
   %%       = P(world(yes,yes,no,no,no,no))
   msw(fi,Fi),                  % P(Fire)
   msw(ta,Ta),                  % P(Tampering)
   msw(sm(Fi),Sm),              % CPT P(Smoke | Fire)
   msw(al(Fi,Ta),Al),           % CPT P(Alarm | Fire,Tampering)
   msw(le(Al),Le),              % CPT P(Leaving | Alarm)
   msw(re(Le),Re).              % CPT P(Report | Leaving)

world(Sm,Re):-
   %% Define marginal distribution for `Smoke' and `Report'
   world(_,_,_,Sm,_,Re).

query(world(_,_)).