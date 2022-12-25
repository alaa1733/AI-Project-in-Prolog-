%%CODE LAST VERSION
%facts
type(restaurant).
type(cafe).

mealType(lunch).
mealType(brakfast).
mealType(dinner).
mealType(spaecilized).
mealType(nonSpecilized).

cuisine(modern).
cuisine(local).
cuisine(italy).
cuisine(indian).
cuisine(international).
cuisine(noType).

price(low).
price(high).


restaurant(voi). 
restaurant(buaffalo).
restaurant(f6orFaris).
restaurant(maqam). 
restaurant(meating).
restaurant(binSaleem). 
restaurant(pizzaHut).
restaurant(zika).
restaurant(marhaba). 
restaurant(benedict).


cafe(starbucks).
cafe(bon).
cafe(dokkan).
cafe(halfMillion).

%composite facts
restaurant(breakfast,modern,high,benedict).
restaurant(breakfast,modern,low,maqam).
restaurant(breakfast,local,low,binsaleem).
restaurant(breakfast,local,high,f6oorfaris).

restaurant(lunch,italy,high,meating).
restaurant(lunch,italy,low,pizzaHut).
restaurant(lunch,indian,high,zika).
restaurant(lunch,indian,low,marhaba).
restaurant(lunch,international,high,voi).
restaurant(lunch,international,low,buaffalo).

cafe(specilized, high, dokan).
cafe(specilized, low, halfmilion).
cafe(nonSpecilized, high, starbucks).
cafe(nonSpecilized, low, bon).

%% rules for restaurant
appropriate('benedict',MealType, Cuisine,Price) :- 
     MealType = breakfast,
     Cuisine=modern,
     Price=high,!.
    

appropriate('Maqam',MealType, Cuisine,Price) :- 
     MealType = breakfast,
  	 Cuisine=modern,
 	 Price=low,!.
   

appropriate('f6orFaris',MealType, Cuisine,Price) :- 
     MealType = breakfast,
    Cuisine=local,
    Price=high,!. 

appropriate('binSaleem',MealType, Cuisine,Price) :- 
    MealType = breakfast,
    Cuisine=local,
    Price=low,!.

appropriate('meating',MealType, Cuisine,Price) :- 
    (MealType = (lunch); MealType = (dinner)) ,
    Cuisine=italy,
    Price=high,!.

appropriate('pizzaHut',MealType, Cuisine,Price) :- 
      (MealType = (lunch); MealType = (dinner)) ,
    Cuisine=italy,
    Price=low,!.

appropriate('marhaba',MealType, Cuisine,Price) :- 
     (MealType = (lunch); MealType = (dinner)) ,
    Cuisine=indian,
    Price=low,!.


appropriate('buaffalo',MealType, Cuisine,Price) :- 
    (MealType = (lunch); MealType = (dinner)) ,
    Cuisine=international,
    Price=low,!. 


appropriate('zika',MealType, Cuisine,Price) :- 
   (MealType = (lunch); MealType = (dinner)) ,
    Cuisine=indian,
    Price=high,!.

appropriate('voi',MealType, Cuisine,Price) :- 
  (MealType = (lunch); MealType = (dinner)) ,
    Cuisine=international,
    Price=high,!.  

%%rules for cafe

appropriate('starbucks',MealType,Price):-
   MealType= non-specilized ,
    Price=high,!.

appropriate('dokkan',MealType,Price):-
 MealType= spaecilized ,
    Price= high,!.

appropriate('halfmillion',MealType,Price):-
MealType= specilized ,
    Price=low,!.

appropriate('bon',MealType,Price):-
 MealType= non-specilized ,
    Price=low,!.

choice(Respnce,A):-
    ( Respnce == r), findAppropriateRestaurant(A).

choice(Respnce,A):-
     ( Respnce == c), findAppropriateCafe(A).
    
    
go:-
    write(" HI, Welcome to our system ,here you can find a Restaurant or Cafe that you would like"),
    nl, write("Please Enter (r) for Restaurant or (c) for Cafe"),
    read(Respnce),
    choice(Respnce,A),
    write(A),nl,
    write("I hope you find what you like :) ").
    

%%rules for ask questions
findAppropriateCafe(C):-
write('do you prefer a specilized or n specilized coffee?'), nl,
read(MealType),nl,
write( 'do you prefer a high or low price?' ),nl,
read(Price) , nl,
    appropriate(C,MealType,Price).
%cafe(Inputl, Input2,Output), nl,
%write(Output).

findAppropriateRestaurant(R):-
write('breakfast or lunch or dinner?'), nl,
read(MealType),nl,
write('cuisine type? modern,local,italy,indian,international'),nl,
read( Cuisine) , nl,
write( 'do you prefer a high or low price?' ),nl,
read(Price) , nl,  
   appropriate(R,MealType, Cuisine,Price).