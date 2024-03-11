select name from sqlite_master where type = 'table'; --Comando sustitutivo de .tables de sqllite

.tables -- Muestra tablas
.schema Track -- Muestra la sintaxis de la tabla Track

select Composer from Track;
select TrackId,Composer FROM Track;
SELECT TrackId,Name,Milliseconds FROM Track;

-- OFFSET y LIMIT
SELECT TrackId,Name,Composer from Track LIMIT 10; --Acota la salida a 10 resultados
SELECT TrackId,Name,Composer from Track LIMIT 10 OFFSET 10; --Acota salida a 10 y salta 10 primeros resultados

-- UNIQUE RESULTS <DISTINCT>
.schema Customer

SELECT DISTINCT Country from Customer;
SELECT DISTINCT City,Country from Customer;
SELECT DISTINCT Company from Customer;

--Sorting (ordenado)

select TrackId,Name,Milliseconds,AlbumId FROM Track ORDER BY AlbumId;
select TrackId,Name,Milliseconds,AlbumId FROM Track ORDER BY Milliseconds;
select TrackId,Name,Milliseconds,AlbumId FROM Track ORDER BY Milliseconds DESC; --Orden inverso
SELECT Name,Milliseconds,AlbumId from Track ORDER BY AlbumId ASC, Milliseconds DESC; --Doble orden
SELECT Name,Milliseconds from Track ORDER BY Milliseconds DESC LIMIT 10; --Las 10 canciones mas largas
SELECT TrackId,Name,Bytes from Track ORDER BY Milliseconds ASC LIMIT 3; --Las 3 canciones que menos ocupan

--WHERE CLAUSE
    --Acotado string/integer
SELECT TrackId,Name,Composer from Track where Composer='Chico Science';
SELECT TrackId,Name,Composer from Track where AlbumId=1;
    --Multiple acotado
SELECT TrackId,Name,Composer from Track where Milliseconds>1200 and AlbumId=1;
    --Acotado aproximado y no exacto
SELECT TrackId,Name,Composer from Track where Composer LIKE "%Mozart%"; --Los % definene un valor entre null a infinito
SELECT TrackId,Name,Composer from Track where Composer LIKE '%Bach';
    --Multiple acotado multiple
SELECT TrackId,Name,Composer from Track where Composer='Miles Davis' OR Composer='James Brown'; --Manera larga e inefectiva
SELECT TrackId,Name,Composer from Track where Composer IN ("Miles Davis","James Brown"); --Manera corta por listado
    --Acotado discriminador
SELECT TrackId,Name,Composer FROM Track where GenreId NOT IN (1,2,3,4)
SELECT TrackId,Name,Composer FROM Track where GenreId NOT IN (1,2,3,4) and Composer not NULL;
SELECT TrackId,Name,Composer FROM Track where GenreId NOT IN (1,2,3,4) AND Composer NOT NULL OR Milliseconds<1200;

--GROUPS
select AlbumId, COUNT(TrackId) from Track GROUP BY AlbumId;
SELECT count(TrackId) from Track;
SELECT AlbumId, SUM(Milliseconds) from Track group by AlbumId ORDER BY sum(Milliseconds);
SELECT AlbumId, Name, MAX(Milliseconds) from Track group by AlbumId; --La cancion mas larga
SELECT AlbumId, Name, count(TrackId) FROM Track GROUP by AlbumId HAVING count(TrackId)>10; --Los que tengan mas de 10 canciones

--INNER JOIN
select TrackId, Name, Title FROM Track inner join Album on Track.AlbumId = Album.AlbumId;
select TrackId, Name, Title FROM Album inner join Track on Track.AlbumId = Album.AlbumId; --Se puede hacer al reves
select TrackId, Name, Title FROM Track inner join Album on Track.AlbumId = Album.AlbumId where Album.AlbumId=1;

--LEFT OUTER JOIN
SELECT TrackId, Name, Composer, Title FROM Track LEFT OUTER JOIN Album on Track.AlbumId = Album.AlbumId;
SELECT AlbumId, Name, Title from Artist LEFT JOIN Album on Album.ArtistId = Artist.ArtistId WHERE AlbumId is NULL;