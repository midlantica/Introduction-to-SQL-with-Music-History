/* 12. 
Write a SELECT statement to display how many songs exist for each artist. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.
*/
--SELECT Artist.ArtistName,
--       COUNT(Song.Id)
--FROM Song
--     LEFT JOIN Artist ON Song.ArtistId = Artist.Id
--     ORDER BY COUNT(Artist.Id) DESC;

-- TEST
--SELECT Artist.ArtistName,
--       COUNT(Song.Id)
--  FROM Song
--;

/* 11. Write a SELECT statement to display how many songs exist for each album. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence. */
-- SELECT Albums and count songs on each
-- how many song ids are on how many album ids
--SELECT Album.Id,
--	   COUNT(Song.AlbumId)
--FROM Album
--    LEFT JOIN Song ON Song.AlbumId = Song.Title
--;
SELECT Album.Title AS 'Album Title',
       COUNT(Song.AlbumId) AS 'Number of tracks'
FROM Album
     LEFT JOIN Song ON Song.AlbumId = Album.Id
     GROUP BY Album.Title
     ORDER BY COUNT(Song.AlbumId) DESC;


/* 
10. Write a SELECT query that provides the song titles, album title, and artist name 
for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect 
the tables, and the WHERE keyword to filter the results to the album and artist you added. 
*/

SELECT s.Title AS 'Song Title',
       alb.Title AS 'Album Title',
       artn.ArtistName
FROM Album alb
        LEFT JOIN Song s ON s.AlbumId = alb.Id
        LEFT JOIN Artist artn ON s.ArtistId = artn.Id
WHERE alb.Title = 'Revolver';


SELECT s.Title AS 'Song Title',
       albt.Title AS 'Album Title',
       artn.ArtistName
FROM Song s
        LEFT JOIN Album albt ON s.AlbumId = albt.Id
        LEFT JOIN Artist artn ON s.ArtistId = artn.Id
WHERE s.Title = 'Revenge';


SELECT sngt.Title AS 'Song Title',
       albt.Title AS 'Album Title',
       artn.ArtistName
FROM Song s
        LEFT JOIN Song sngt ON s.Title = sngt.Title
        LEFT JOIN Album albt ON s.AlbumId = albt.Id
        LEFT JOIN Artist artn ON s.ArtistId = artn.Id
WHERE sngt.Title = 'Revenge';


/* 9. Using the INSERT statement, add some songs that are on that album to the Song table. */
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
--VALUES ('Drew''s bad', 10, '12/03/2020', 9, 8, 23);

/* 8. Using the INSERT statement, add one, or more, albums by your artist to the Album table. */
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) 
--VALUES ('The Drew H Album', '11/14/2020', 2270, 'Sun Records', 27, 13);



/* 7. Using the INSERT statement, add one of your favorite artists to the Artist table. */
--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Black Keys', 2001);

/* QUESTIONS 1-6 below */
/* 4. Write a SELECT query that lists all the Artists that have a Pop Album */
--Select ArtistId
--Select ArtistId
--From Album
--Where GenreId = 1;

/* 5.  Write a SELECT query that lists all the Artists that have a Jazz or Rock Album */
SELECT a.ArtistName
FROM Artist a 
INNER JOIN Album alb on a.id =alb.ArtistId
WHERE alb.GenreId IN (SELECT id
                       FROM Genre
                       WHERE label = 'Jazz' 
                       OR 
                       label = 'Rock');

--Select ArtistId
--From Album
--Where GenreId = 1 OR Genre;

--INSERT INTO Genre (Label) VALUES ('Techno');

--SELECT Title 
--  FROM Album 
-- WHERE AlbumLength = 0;

/* GENRE */
--SELECT a.ArtistName,
--	   al.Album,
--	   al.Label
--  FROM Album al
--	   LEFT JOIN Artist a on al.GenreId = al.id;

/* SHORT FORM OF BELOW */
SELECT s.Title,
       a.ArtistName
  FROM Song s
       LEFT JOIN Artist a on s.ArtistId = a.id;

/* LONG FORM OF ABOVE */
SELECT Song.Title,
       Artist.ArtistName
  FROM Song
       LEFT JOIN Artist on Song.ArtistId = Artist.id;

SELECT * FROM Song;

SELECT * FROM Artist ORDER BY ArtistName;

SELECT * FROM Genre;

select SongLength from Song where Id = 20;

-- The following is the output you get when you run the query above.
--> 237

--update Song
--set SongLength = 1000
--where Id = 20;

-- Once you run the update statement, in order to make sure the value has changed, we run the select query again.
--select SongLength, Title from Song where Id = 2;
--> 515

SELECT
    Id,
    Title,
    SongLength,
    ReleaseDate,
    GenreId,
    ArtistId,
    AlbumId
FROM Song;

SELECT
    Id,
    Title,
    ReleaseDate
FROM Song;

SELECT * FROM Song;

SELECT
    Id,
    Title,
    SongLength,
    ReleaseDate,
    GenreId,
    ArtistId,
    AlbumId
FROM Song
WHERE SongLength > 100;