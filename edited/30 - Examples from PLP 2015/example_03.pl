maxX(4). % number of downward links
maxY(4). % number of rightward links

% node coordinates start from 0
node(X,Y) :- maxX(XM),maxY(YM),between(0,XM,X),between(0,YM,Y).

% these are all links in the factor graph
link(X1,Y,X2,Y) :- node(X1,Y),X2 is X1+1,node(X2,Y). % vertical links
link(X,Y1,X,Y2) :- node(X,Y1),Y2 is Y1+1,node(X,Y2). % horizontal links

% for each link, the potential is the same
0.1::pot(X1,Y1,true,X2,Y2,true);0.2::pot(X1,Y1,false,X2,Y2,true);0.3::pot(X1,Y1,false,X2,Y2,false);0.4::pot(X1,Y1,true,X2,Y2,false) :- link(X1,Y1,X2,Y2).

% a node (X,Y) has a value V if some potential it is involved in assigns that value
node_val(X,Y,V) :- node(X,Y),pot(X,Y,V,_,_,_).
node_val(X,Y,V) :- node(X,Y),pot(_,_,_,X,Y,V).

% but no node can be both true and false at the same time
err :- node_val(X,Y,true),node_val(X,Y,false).
evidence(err,false).

% what is the probability that the top left and bottom right node have the same truth value?
agree(V) :- node_val(0,0,V), maxX(X), maxY(Y), node_val(X,Y,V).
query(agree(_)).