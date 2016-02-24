%% DIRECTIVE
lambdaCut(0.5).

%% PROXIMITY RELATIONS
%% Location Distance Relationship
0.30::equals(beverly_hills,downtown).
0.45::equals(beverly_hills,santa_monica).
0.56::equals(beverly_hills,hollywood).
0.90::equals(beverly_hills,westwood).
0.45::equals(downtown,hollywood).
0.23::equals(downtown,santa_monica).
0.25::equals(downtown,westwood).
0.30::equals(hollywood,santa_monica).
0.45::equals(hollywood,westwood).
0.90::equals(santa_monica,westwood).

%% Category Relationship
0.6::equals(comedy,drama).
0.3::equals(comedy,adventure).
0.3::equals(comedy,suspense).
0.6::equals(drama,adventure).
0.6::equals(drama,suspense).
0.9::equals(adventure,suspense).

%% Films Table
%% film(Title, Director, Category)
film(four_feathers, korda, adventure).
film(modern_times, chaplin, comedy).
film(psycho, hitchcock, suspense).
film(rear_window, hitchcock, suspense).
film(robbery, yates, suspense).
film(star_wars, lucas, adventure).
film(surf_party, dexter, drama).

%% Theaters Table
%% theater(Name,Owner,Location).
theater(chinese,mann,hollywood).
theater(egyptian,va,westwood).
theater(music_hall,lae,beverly_hills).
theater(odeon,cineplex,santa_monica).
theater(rialto,independent,downtown).
theater(village,mann,westwood).

%% Engagements Table
%% engagement(Film,Theater)
engagement(modern_times,rialto).
engagement(start_wars,rialto).
engagement(star_wars,chinese).
engagement(rear_window,egyptian).
engagement(surf_party,village).
engagement(robbery,odeon).
engagement(modern_times,odeon).
engagement(four_feathers,music_hall).

%% SOFT RULES
equals(X,X).
equals(X,Y) :- equals(Y,X).

%% MAIN RULE
%% search(input, input, output, output)
search(Category, Location, Film, Theater) :-
    film(Film, _, Category2),
    engagement(Film, Theater),
    theater(Theater, _, Location2),
    equals(Category2, Category),
    equals(Location2, Location).

query(search(adventure, westwood, Film, Theater)).