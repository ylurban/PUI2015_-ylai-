SELECT
	CDB_TransformToWebmercator(
		CDB_LatLng(
		  start_station_latitude,
		  start_station_longitude
        )) as the_geoM_webmercator,

	start_station_name,
	start_station_id,
	count (*) as numtrips
   
FROM yuan.citibike


WHERE
	st_dwithin(
		CDB_LatLng(
		  end_station_latitude,
		  end_station_longitude
        )::GEOGRAPHY,
        CDB_LatLng(40.7307602, -73.9974086)::GEOGRAPHY,
        1000
        )     
AND
extract (dow from starttime) in (0,6)


GROUP BY
	start_station_name,
	start_station_id,
	start_station_latitude,
	start_station_longitude

ORDER BY numtrips DESC 
LIMIT 5




