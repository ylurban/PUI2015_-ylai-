SELECT
	start_station_name,
	start_station_id,
	end_station_name,
	end_station_id,
	count (tripduration) as numtrips
   
FROM yuan.citibike


GROUP BY
	start_station_name,
	start_station_id,
	end_station_name,
	end_station_id
	

ORDER BY COUNT(*) DESC



