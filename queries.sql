SELECT ArtistName, YearEstablished
FROM Artist
WHERE YearEstablished > 1970
AND YearEstablished < 2000
ORDER BY YearEstablished DESC
;

SELECT a.Title,
			a.AlbumLength,
			a.Label AS AlbumLabel,
			ar.ArtistName,
			ar.YearEstablished,
			g.Label AS GenreLabel
FROM Album a
JOIN Artist ar ON a.ArtistId = ar.ArtistId
JOIN Genre g ON a.GenreId = g.GenreId
;

SELECT * 
FROM Song s
JOIN Album al ON al.AlbumId = s.AlbumId 
JOIN Artist ar ON ar.ArtistId = s.ArtistId 
JOIN Genre g ON g.GenreId = s.GenreId 
;

INSERT INTO Artist
(ArtistName, YearEstablished)
VALUES
("Mariah Carey", 1995)
;

SELECT * FROM Artist
;

--DELETE FROM Artist WHERE ArtistId = 29
--;

--SELECT * FROM Artist
--;

UPDATE Artist 
	SET ArtistName = "Mariah L Carey"
	WHERE ArtistId = 30
	;
	
	SELECT * 
	FROM Album a
	LEFT JOIN Song s ON s.AlbumId = a.AlbumId
	;
	
	SELECT *
	FROM Genre g
	;
	
	INSERT INTO Artist 
	(ArtistName, YearEstablished)
VALUES
	("CeCe Winans", 2018);
	
	INSERT INTO Album
	(Title, ReleaseDate, ArtistId)
	VALUES
	("Love", "2018", 31)
	;
	
	--Which Genre has the most albums assigned to it?
	
	SELECT g.Label, COUNT(al.AlbumId) AS AlbumCount
	FROM Genre g
	JOIN Album al ON al.GenreId = g.GenreId
	GROUP BY g.Label
	ORDER BY AlbumCount DESC 
	LIMIT 1
	;
	
	--1. Query all of the entries in the Genre table
	SELECT * 
	FROM Genre
	;
	
	--2. Using the INSERT statement, add one of your favorite artists to the Artist table.
	INSERT INTO Artist 
	(ArtistName, YearEstablished)
VALUES
	("CeCe Winans", 2018);
	
	--3 Using the INSERT statement, add one, or more, albums by your artist to the Album table.
	INSERT INTO Album
	(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
	VALUES
	("Love", "2018", 120, "All Things", 31, 2)
	;
	
	--4. Using the INSERT statement, add some songs that are on that album to the Song table.
	INSERT INTO Song
	(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
	VALUES
	("Random", 2.5, "2018", 2, 31, 23)
	;
	
	--5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
	SELECT a.Title, s.Title 
	FROM Album a 
	LEFT JOIN Song s 
	ON s.AlbumId = a.AlbumId;
--5 Answer
	SELECT a.Title, s.Title, ar.ArtistName
	FROM Song s 
	LEFT JOIN Album a
	ON s.AlbumId = a.AlbumId
	JOIN Artist ar
	ON s.ArtistId = ar.ArtistId
	WHERE ar.ArtistId = 31
	;
	
	--6 Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
	SELECT al.Title, COUNT(s.AlbumId) AS SongCount
	FROM Album al
	JOIN Song s ON s.AlbumId = al.AlbumId
	GROUP BY al.Title
	ORDER BY SongCount DESC 
	;
	
	--SELECT g.Label, COUNT(al.AlbumId) AS AlbumCount
	--FROM Genre g
	--JOIN Album al ON al.GenreId = g.GenreId
	--GROUP BY g.Label
	--ORDER BY AlbumCount DESC 
	--LIMIT 1
	--;
	
	--7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
	SELECT ar.ArtistName, COUNT(s.ArtistId) AS SongCount
	FROM Artist ar
	JOIN Song s ON s.ArtistId = ar.ArtistId
	GROUP BY ar.ArtistName
	ORDER BY SongCount DESC 
	;
	
	--8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
	SELECT g.Label, COUNT(s.GenreId) AS SongCount
	FROM Genre g
	JOIN Song s ON s.GenreId = g.GenreId
	GROUP BY g.Label
	ORDER BY SongCount DESC 
	;
	
	--9.  Using Max to find longest album 
	SELECT al.Title,
				MAX(al.AlbumLength)
	FROM Album al
	;
	
	--10. Use Max function - song with Longest Duration (display title and duration)
	SELECT s.Title, 
				MAX(s.SongLength)
	FROM Song s
	;
	
	--11. Modify the previous query to also display the title of the album.
	SELECT s.Title, 
				MAX(s.SongLength),
				al.Title
	FROM Song s
	JOIN Album al
	on s.AlbumId = al.AlbumId
	;
	