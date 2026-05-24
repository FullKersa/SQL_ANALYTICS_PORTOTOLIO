-- ============================================================
-- SOAL LATIHAN WINDOW FUNCTION: DENSE_RANK (Sistem Juara Bersama)
-- ============================================================
-- 1. Tampilkan nama, score, dan class dari tabel students.
-- 2. Tampilkan peringkat PERTAMA (Rank 1) untuk setiap kelas.
-- 3. ATURAN: Jika ada dua atau lebih murid dengan skor tertinggi 
--    yang SAMA di kelas tersebut, tampilkan SEMUANYA.
-- 4. Gunakan fungsi DENSE_RANK() agar tidak ada nomor yang melompat.
-- 5. Urutkan hasil akhir berdasarkan class (1-9).
-- ============================================================
-- SOAL LATIHAN WINDOW FUNCTION: ROW_NUMBER
-- 1. Tampilkan nama, score, dan class dari tabel students.
-- 2. Ambil hanya SATU orang pemenang (peringkat 1) untuk setiap kelas.
-- 3. Jika ada murid dengan skor yang sama (seri), tentukan pemenang 
--    berdasarkan urutan abjad nama yang paling awal (A-Z).
-- 4. Gunakan fungsi ROW_NUMBER() untuk memastikan tidak ada ranking ganda.

WITH CTE AS(
SELECT name, score, class,
ROW_NUMBER() OVER (PARTITION BY class ORDER BY score DESC) ranking
FROM students)
SELECT * FROM CTE
WHERE ranking = 1;
