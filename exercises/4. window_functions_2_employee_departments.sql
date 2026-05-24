-- Tantangan SQL: Peringkat & Ambang Batas
-- Tampilkan dua karyawan bergaji tertinggi pada setiap departemen.
-- Pilih departemen yang total gajinya melampaui rata-rata total gaji departemen.
-- Aturan Main:
-- Gunakan fungsi DENSE_RANK() untuk menentukan peringkat gaji.
-- Gunakan CTE untuk memisahkan logika perhitungan agregat.
-- Dilarang menggunakan klausa LIMIT atau OFFSET.
-- Urutkan hasil berdasarkan nama departemen secara alfabetis.

WITH DEPSTAT AS (SELECT DEPARTMENTID, SUM(SALARY) TOTAL_SAL, AVG(SUM(SALARY)) OVER() as AVG_SAL FROM EMPLOYEES
					GROUP BY DEPARTMENTID),
	
RANKED AS (SELECT e.name AS employee, 
         d.name AS department, 
         e.salary,
		DENSE_RANK() OVER (PARTITION BY E.DEPARTMENTID ORDER BY SALARY DESC) AS RANKING
		FROM EMPLOYEES E
	    JOIN DEPARTMENTS D ON D.ID = E.DEPARTMENTID
	    JOIN DEPSTAT DS ON DS.DEPARTMENTID = E.DEPARTMENTID
	    WHERE DS.TOTAL_SAL > DS.AVG_SAL )

SELECT * FROM RANKED
WHERE RANKING <= 2
ORDER BY department ASC;
