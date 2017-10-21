CREATE TRIGGER tr_ArriveFlights ON Flights AFTER UPDATE
AS
 INSERT INTO ArrivedFlights (FlightID, ArrivalTime, Origin, Destination, Passengers)
 SELECT FlightID
		,ArrivalTime
		,orig.AirportName AS OriginAirport
		,dest.AirportName AS DestinationAirport
		,(SELECT COUNT(*) FROM Tickets WHERE FlightID = i.FlightID) AS Passengers
  FROM inserted AS i
  JOIN Airports as orig ON orig.AirportID = i.OriginAirportID
  JOIN Airports as dest ON dest.AirportID = i.DestinationAirportID
  WHERE Status = 'Arrived' 