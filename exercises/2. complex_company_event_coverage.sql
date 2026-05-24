-- Tampilkan nama perusahaan dengan kriteria berikut.
-- Perusahaan harus memiliki minimal dua mobil.
-- Tiap mobil tersebut mengikuti tiga event.
-- Hitung persentase cakupan event perusahaan itu.
-- Cakupan adalah event unik per total.
-- Filter perusahaan dengan cakupan di atas 50%.
-- Urutkan hasil berdasarkan jumlah partisipasi terbanyak.

-- Kriteria Output:
-- company_name
-- total_cars
-- total_unique_events
-- event_coverage_percentage

WITH CTE AS (
    SELECT 
        c.name AS car_name,
        comp.name AS company_name,
        ep.carid,
        ep.eventid
    FROM eventparticipants ep
    LEFT JOIN cars c ON c.id = ep.carid
    LEFT JOIN companies comp ON comp.id = c.companyid
)
SELECT company_name, 
		COUNT(DISTINCT carid) total_cars, 
		COUNT(distinct eventid) total_unique_events,
		(COUNT(distinct eventid) * 100/(SELECT COUNT(id) FROM events)) event_coverage_percentage
FROM CTE
GROUP BY company_name
HAVING COUNT(DISTINCT carid) >= 2 
		AND COUNT(distinct eventid) >= 3 
		AND (COUNT(distinct eventid) * 100/(SELECT COUNT(id) FROM events)) > 50
ORDER BY total_unique_events DESC;
