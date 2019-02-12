padrede('juan','maria').
padrede('pablo','juan').
padrede('pablo','marcela').
padrede('carlos','debora').
padrede('pablo','jose').
padrede('sandra','maria').

hijode(A,B):-padrede(B,A).
abuelode(A,B):-padrede(A,C), padrede(C,B).
hermanode(A,B):-padrede(C,A), padrede(C,B), A \== B.
tiode(A,B):- hermanode(A,C), hijode(B,C).
primode(A,B):- hijode(A,C), hijode(B,D), hermanode(C,D).
nietode(A,B):- padrede(B,C), padrede(C,A).

familiarde(A,B):-padrede(A,B).
familiarde(A,B):-abuelode(A,B).
familiarde(A,B):-hermanode(A,B).
familiarde(A,B):-tiode(A,B).
familiarde(A,B):-primode(A,B).
familiarde(A,B):-nietode(A,B).

escasado(A) :- padrede(A,C), hijode(C,B), A\==B.

esfeliz(A) :-  not(escasado(A)).


