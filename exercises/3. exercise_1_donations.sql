-- Tampilkan nama benefactor dan total donasi yang di atas rata-rata donasi keseluruhan

SELECT b.name, SUM(amount) 
FROM donations
LEFT JOIN benefactors b ON b.id = donations.benefactorid
GROUP BY b.name
HAVING SUM(donations.amount) > (SELECT AVG(amount) FROM donations);
