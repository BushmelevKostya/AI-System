% объявление динамических предикатов
:- dynamic накормлено/1, вымирает/1, падальщик/1.

% факты
животное(животное1).
животное(животное2).
животное(животное3).
животное(животное4).
животное(животное5).
животное(животное6).
животное(животное7).

хищник(животное1).
водоплавающее(животное2).
водоплавающее(животное1).
ядовитое(животное3).
падальщик(животное4).
жировой_запас(животное6).
жировой_запас(животное7).

сотрудничество(животное1, животное2).
сотрудничество(животное2, животное3).
скрытное(животное5, камуфляж).
скрытное(животное1, большое).
скрытное(животное2, норное).
скрытное(животное3, быстрое).
скрытное(животное4, отбрасываетХвост).
требует_дополнительного_корма(животное3, паразит).
требует_дополнительного_корма(животное4, большое).


% правила
ест(Хищник, Жертва) :-
    хищник(Хищник),
    животное(Жертва),
    в_одной_среде(Хищник, Жертва),
    Хищник \= Жертва,
    assertz(накормлено(Хищник)),
    (вымирает_если_ядовитое(Хищник, Жертва) ; true),
    (накормлено_если_падальщик ; true).

в_одной_среде(А, Б) :- 
    водоплавающее(А), 
    водоплавающее(Б).

в_одной_среде(А, Б) :- 
    \+ водоплавающее(А), 
    \+ водоплавающее(Б).

вымирает_если_ядовитое(Хищник, Жертва) :- 
    ядовитое(Жертва), 
    assertz(вымирает(Хищник)).

накормлено_если_падальщик :- 
    падальщик(Животное), 
    assertz(накормлено(Животное)), 
    fail.
