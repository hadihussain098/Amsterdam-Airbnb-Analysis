--Which neighbourhoods have the lowest average price per night in Amsterdam?
Select
Round(avg(price), 2) as average_price_per_night,
neighbourhood_cleansed
from silver_listing
Group by neighbourhood_cleansed
Order by average_price_per_night Asc

-- Osdorp shows lowest average price per night costing $175 followed by Gaasperdam - Driemond 192.96 and Bijlmer-Centrum 193.53
