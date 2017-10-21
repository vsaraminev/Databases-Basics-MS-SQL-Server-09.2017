SELECT 
departing.AirportID,
departing.AirportName,
COUNT(t.CustomerID) AS Passangers
FROM (SELECT * FROM Airports AS a
JOIN Flights AS f ON f.OriginAirportID = a.AirportID
WHERE f.Status = 'Departing') AS departing
JOIN Tickets AS t ON t.FlightID = departing.FlightID
GROUP BY departing.AirportID, departing.AirportName