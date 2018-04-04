USE johannesp;

-- Fråga 1. Vilka filmer som firman äger, inklusive data om filmen. 

SELECT * FROM view_moviesInStore;

-- Fråga 2. Vilka filmer som finns i en viss genre.

SELECT * FROM view_moviesInDrama;

-- Fråga 3. Vilka filmer som är uthyrda, vem som hyrde dem (kund) och vem som hyrde ut dem (anställd).

SELECT * FROM view_rentalInfo;

-- Fråga 4. Vilka filmer som har gått över tiden, dvs filmer som inte har blivit återlämnade trots att de borde vara det, 
-- tillsammans med namnet på kunden som har hyrt den.

SELECT * FROM view_overduemovies;

-- Fråga 5. En lista över alla anställda och hur många filmer varje anställd har hyrt ut.

SELECT * FROM view_employeeRentalInfo;

-- Fråga 6. En lista med statistik över de mest uthyrda filmerna den senaste månaden. Se fråga 10.

SELECT * FROM view_movieRentalsLastMonth;
