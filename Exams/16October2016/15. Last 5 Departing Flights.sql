SELECT TOP(5)	
		temp.FlightID,
		temp.DepartureTime,
		temp.ArrivalTime,
		ao.AirportName AS Origin,
		ad.AirportName AS Destination
 FROM  
(SELECT TOP(5) * FROM Flights AS f
WHERE Status = 'Departing'
ORDER BY f.DepartureTime DESC) AS temp
 JOIN Airports AS ao ON ao.AirportID = temp.OriginAirportID
 JOIN Airports AS ad ON ad.AirportID = temp.DestinationAirportID 
 ORDER BY temp.DepartureTime, temp.FlightID