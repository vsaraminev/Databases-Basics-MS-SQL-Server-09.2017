SELECT DISTINCT TOP(5) a.AirlineID, 
					   a.AirlineName, 
					   a.Nationality, 
					   a.Rating 
				  FROM Airlines AS a
JOIN Flights AS f ON f.AirlineID = a.AirlineID
WHERE f.Status <> 'Arrived'
ORDER BY Rating DESC, a.AirlineID ASC