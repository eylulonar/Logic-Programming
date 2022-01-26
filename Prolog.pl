person(X):- man(X).
person(X):- woman(X).
man(gencer). 
man(can). 
man(rasim).
woman(beyza). 
woman(canan). 
woman(meryem).

%we specify that each person is different from each other.
distinct(A,B,C,D,E,F):- person(A), person(B), person(C), person(D), person(E), person(F),  \+A=B, \+A=C, \+A=D, \+A=E, \+A=F, \+B=C, \+B=D, \+B=E, \+B=F, \+C=D, \+C=E, \+C=F, \+D=E, \+D=F, \+E=F.
guilty(X) :-
   distinct(Blue, Orange, Red, Purple, Green, Yellow),
   distinct(Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),

    
% For Clue1: we know that red bag is carried by a man.
	man(Red), 
   \+Red=Cookies, \+Red=Chocolate, \+Red=Avocado, \+Red=Onion,
    
    
% For Clue2: we know that blue and yellow bags belong to either beyza or meryem.
    woman(Yellow), woman(Blue), \+canan=Yellow, \+canan=Blue, 
    \+beyza=Orange, \+beyza=Red, \+beyza=Purple, \+beyza=Green, \+meryem=Orange, \+meryem=Red, \+meryem=Purple, \+meryem=Green,
    
% For Clue3: we specify that avocado was not carried by gencer nor beyza and not in the orange or blue bag.
	\+beyza=Avocado, \+gencer=Avocado, \+Avocado=Blue, \+Avocado=Orange,
    
% For Clue4: 
   woman(Cookies), Cookies=Yellow,  

% For Clue5: we know that purple bag is carried by a man and it is not Rasim.
    man(Purple), \+Purple=rasim,

% For Clue6:
    \+Chocolate=Orange,
    
% For Clue7:
    \+meryem=Yellow, \+meryem=Green,
    
% For Clue8: 
    gencer=Onion,

%For Clue9:
Nuts=Green, Green=X,

    
write(X),write(" has kidnapped the parrot."), nl, 

resolve(Blue, Orange, Red, Purple, Green, Yellow, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies).
resolve(Blue, Orange, Red, Purple, Green, Yellow, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):- 
  write(Blue), write(" has the blue bag."), nl,
  write(Orange), write(" has the orange bag."), nl, 
  write(Red), write(" has the red bag."), nl,
  write(Purple), write(" has the purple bag."), nl,
  write(Green), write(" has the green bag."), nl,
  write(Yellow), write(" has the yellow bag."), nl,
  write(Avocado), write(" carried avocado in the bag, so he/she is innocent."), nl,
  write(Onion), write(" carried onion in the bag, so he/she is innocent."), nl,
  write(Nuts), write(" carried nuts in the bag, so he/she is the guilty."), nl,
  write(Chocolate), write(" carried chocolate in the bag, so he/she is innocent."), nl,
  write(Garlic), write(" carried garlic in the bag, so he/she is innocent."), nl,
  write(Cookies), write(" carried cookies in the bag, so he/she is innocent."), nl.

 









