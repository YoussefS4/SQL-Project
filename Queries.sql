/* Query 1 - query used for first insight */

WITH table1 AS(
	SELECT c.Country,sum(i.total) TotalSpent, c.FirstName,c.LastName,c.CustomerId
	FROM Customer c
	JOIN Invoice i
	ON c.CustomerId = i.CustomerId
	GROUP BY 5
)
select table1.*
from table1
JOIN (
	SELECT Country,max(TotalSpent) TotalSpent, FirstName,LastName,CustomerId
	FROM table1
	GROUP BY 1
) table2
ON table1.TotalSpent = table2.TotalSpent
WHERE table1.Country = table2.Country
ORDER BY TotalSpent DESC, Country
LIMIT 5;

/* Query 2 - query used for second insight */

SELECT Artist.Name, sum(InvoiceLine.Quantity) * InvoiceLine.UnitPrice  AmountSpent
FROM Artist
JOIN Album
ON Artist.ArtistId = Album.ArtistId
JOIN Track
ON Track.AlbumId = Album.AlbumId
JOIN	InvoiceLine
ON InvoiceLine.TrackId = Track.TrackId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

/* Query 3 - query used for third insight */

SELECT a.ArtistId, a.Name, count(t.TrackId) Songs
FROM Artist a
JOIN Album al
ON a.ArtistId  = al.ArtistId
JOIN Track t
ON al.AlbumId = t.AlbumId
JOIN Genre g
ON g.GenreId = t.GenreId
WHERE g.name =  'Rock'
GROUP BY 2
ORDER BY 3 DESC
LIMIT 10

/* Query 4 - query used for fourth insight */

SELECT Album.Title,count(invoice.InvoiceDate) Sold
FROM Album
JOIN Track
ON Album.AlbumId = Track.AlbumId
JOIN InvoiceLine
ON InvoiceLine.TrackId = Track.TrackId
JOIN Invoice
ON invoice.InvoiceId = InvoiceLine.InvoiceId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5


