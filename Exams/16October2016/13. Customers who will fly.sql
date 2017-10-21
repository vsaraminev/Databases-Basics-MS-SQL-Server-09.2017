SELECT DISTINCT 
	   c.CustomerID,
	   c.FirstName + ' ' + ISNULL(c.LastName, ' ') AS FullName,
	   DATEDIFF(YEAR,c.DateOfBirth, '2016-01-01') AS Age
  FROM Customers AS c
  JOIN Tickets AS t ON t.CustomerID = c.CustomerID
  JOIN Flights AS f ON f.FlightID = t.FlightID
 WHERE f.Status = 'Departing'
 ORDER BY Age ASC, c.CustomerID ASC