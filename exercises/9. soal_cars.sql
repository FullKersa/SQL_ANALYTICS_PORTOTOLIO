-- 1. Dasar: Mobil dan Perusahaan
-- 2. Menengah: Total Mobil Perusahaan
-- 3. Advanced: Mobil Tanpa Event
-- Serta pencarian event spesifik dengan > 1 partisipasi

SELECT c.name, comp.name 
FROM cars c 
JOIN companies comp ON c.companyid = comp.id;

SELECT comp.name company_name, COUNT(c.id) total_cars 
FROM cars c 
JOIN companies comp ON c.companyid = comp.id 
GROUP BY company_name;

SELECT comp.name company_name, COUNT(c.id) idle_cars_count 
FROM cars c 
JOIN companies comp ON c.companyid = comp.id 
WHERE c.id NOT IN (SELECT carid FROM eventparticipants) 
GROUP BY company_name;

WITH CTE AS (SELECT cars.id, cars.name car_name, companies.name company_name
			 FROM cars LEFT JOIN companies ON companies.id = cars.companyid)

select company_name, car_name, COUNT(DISTINCT eventid) 
from eventparticipants ev
LEFT join CTE ON ev.carid = CTE.id
GROUP BY company_name,car_name
HAVING COUNT(DISTINCT eventid)  > 1;
