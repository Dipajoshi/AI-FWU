male(ram).
male(luv).
male(laxman).
male(bharat).
male(shatrughan).
male(dashrath).
male(kush).

female(sita).
female(urmila).
female(kaushalya).

wife(sita, ram).
wife(urmila, laxman).
wife(kaushalya, dashrath).
father(ram, luv).
father(ram, kush).
father(dashrath, ram).
father(dashrath, laxman).
father(dashrath, bharat).
father(dashrath, shatrughan).

mother(X, Y) :- father(Z, Y), wife(X, Z).
parent(X, Y) :- father(X,Y); mother(X, Y).

child(X, Y) :- father(Y, X); mother(Y, X).

son(X, Y) :- male(X), child(X, Y).
daughter(X, Y) :- female(X), child(X, Y).

brother(X, Y) :- male(X), X \= Y, child(X, Z), child(Y, Z).
sister(X, Y) :- female(X), X \= Y, child(X, Z), child(Y, Z).

uncle(X, Y) :- male(X), child(Y, Z), brother(X, Z).
aunt(X, Y) :- female(X), child(Y, Z), (sister(X, Z); (wife(X, T), brother(T, Z))).

ancestor(X, Y) :- parent(X, Y); parent(Z, Y), ancestor(X, Z).
