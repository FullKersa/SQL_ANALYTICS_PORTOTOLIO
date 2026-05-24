-- Tampilkan karyawan yang gajinya lebih tinggi dari rata-rata departemen lain.
-- Hitung juga selisihnya dengan gaji tertinggi di departemen mereka sendiri.
-- Gunakan kriteria Window Functions tanpa menggunakan klausa GROUP BY.
-- Urutkan hasil berdasarkan selisih gaji terbesar secara menurun.

SELECT *,
	MAX(SALARY) OVER(PARTITION BY DEPARTMENTID) - SALARY AS SALARY_DIF
FROM
	(SELECT *,
			(SUM(SALARY) OVER() - SUM(SALARY) OVER(PARTITION BY DEPARTMENTID)) / (COUNT(*) OVER() - COUNT(*) OVER(PARTITION BY DEPARTMENTID)) AS AVG_OTHERS
FROM EMPLOYEES) SUB
WHERE SALARY > AVG_OTHERS
ORDER BY SALARY_DIF DESC;
