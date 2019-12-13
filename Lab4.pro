parent(alexei,tolia).
parent(alexei,volodia).
parent(tolia,tima).
 
slova([tolia,toli,tolin]).
slova([alexei,alexeia,alexeia]).
slova([tima,timi,timi]).
slova([volodia,volodi,volodin]).
 
brother(X,Y):-parent(P,X),parent(P,Y),X\=Y.
 
specialword(kto).
specialword(chei).
specialword(brat).
 
answer([chei,brat,X,'?'],A):-not(specialword(X)),!,
    (brother(X,Y),slova([Y,_,A]),!;A='ne izvestno').
answer([X,brat,Y,'?'],A):-not(specialword(X)),not(specialword(Y)),!,
    (brother(X,Y1),slova([Y1,Y,_]),!,A='yes';A='no').
answer([kto,X,brat,'?'],A):-not(specialword(X)),!,
    (slova([X1,_,X]),brother(X1,A),!;A='ne izvestno').
answer(_,'oshibka sintaksisa').