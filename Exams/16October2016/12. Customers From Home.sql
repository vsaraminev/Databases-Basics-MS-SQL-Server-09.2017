SELECT c.CustomerID, 
	   c.FirstName + ' ' + ISNULL(c.LastName,' ') AS FullName,
	   t.TownName AS HomeTown
  FROM Customers AS c
 INNER JOIN Towns AS t ON t.TownID = c.HomeTownID
 INNER JOIN Tickets AS tic ON tic.CustomerID = c.CustomerID
 INNER JOIN Flights AS f ON f.FlightID = tic.FlightID
 INNER JOIN Airports AS a ON a.AirportID = f.OriginAirportID
 WHERE a.TownID = t.TownID AND f.Status = 'Departing'