SELECT t.TicketID, 
	   a.AirportName AS Destination, 
	   c.FirstName + ' ' + ISNULL(c.LastName, ' ') AS CustomerName
  FROM Tickets AS t
INNER JOIN Customers AS c ON c.CustomerID = t.CustomerID
INNER JOIN Flights AS f ON f.FlightID = t.FlightID
INNER JOIN Airports AS a ON a.AirportID = f.DestinationAirportID
WHERE Price < 5000 AND Class = 'First'