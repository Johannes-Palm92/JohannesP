use johannesp;

-- fråga 1. vilka filmer som firman äger, inklusive data om filmen. 

select * from view_moviesinstore;

-- fråga 2. vilka filmer som finns i en viss genre.

select * from view_moviesindrama;

-- fråga 3. vilka filmer som är uthyrda, vem som hyrde dem (kund) och vem som hyrde ut dem (anställd).

select * from view_rentalinfo;

-- fråga 4. vilka filmer som har gått över tiden, dvs filmer som inte har blivit återlämnade trots att de borde vara det, 
-- tillsammans med namnet på kunden som har hyrt den.

select * from view_overduemovies;

-- fråga 5. en lista över alla anställda och hur många filmer varje anställd har hyrt ut.

select * from view_employeerentalinfo;

-- fråga 6. en lista med statistik över de mest uthyrda filmerna den senaste månaden. se fråga 10.

select * from view_movierentalslastmonth;

-- fråga 7. en stored procedure som ska köras när en film lämnas ut. ska alltså sätta filmen till uthyrd, vem som hyrt den osv.

call sp_onrental(1,1,1);

-- fråga 8. gör en funktion som tar en film som parameter och returnerar olika värden beroende på om filmen är sent inlämnad eller inte. dvs,
-- om du matar in film nr 345 ska du få tillbaka true om filmen är uthyrd men borde vara tillbakalämnad, annars false. 
-- (1 och 0 funkar också om det är lättare.)

select isitlate(1);
select isitlate(3);

-- fråga 9. en stored procedure som ska köras när en film lämnas tillbaka.
-- den ska använda sig av ovanstående funktion för att göra någon form av markering/utskrift om filmen är återlämnad för sent.
 
call sp_onreturn(1);
call sp_onreturn(3);

-- fråga 10.du ska underhålla en statistiktabell med hjälp av triggers. 
-- när du lämnar ut en fil ska det göras en notering om det i din statistiktabell. 
-- du får inte lägga till informationen från din sp ovan, det ska skötas med triggers.

show triggers;
select * from rentallog;
call sp_onrental(2,2,2);
select * from rentallog;