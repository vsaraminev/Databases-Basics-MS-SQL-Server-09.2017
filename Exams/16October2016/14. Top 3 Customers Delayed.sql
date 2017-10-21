--SELECT top(3) FlightID FROM Customers AS c
--JOIN Tickets AS t ON t.CustomerID = c.CustomerID
--ORDER BY t.Price DESC
SELECT TOP(3) c.CustomerID,
c.FirstName + ' ' + ISNULL(c.LastName, ' ') AS FullName,
t.Price,
a.AirportName
 FROM Flights AS f
INNER JOIN Tickets AS t ON t.FlightID = f.FlightID
INNER JOIN Customers AS c ON c.CustomerID = t.CustomerID
INNER JOIN Airports AS a ON a.AirportID = f.DestinationAirportID
WHERE f.Status = 'Delayed'
ORDER BY t.Price DESC, c.CustomerID ASC
