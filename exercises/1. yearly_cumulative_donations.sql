/*
================================================================================
SOAL TANTANGAN SQL: LAPORAN KONTRIBUSI DONASI KUMULATIF & PERSENTASE
================================================================================

DESKRIPSI:
Buatlah kueri untuk menghasilkan laporan donasi tahunan yang mendetail.
Laporan harus mencakup akumulasi per donatur dan bobot kontribusi mereka.

KRITERIA OUTPUT:
1. Nama Donatur:
   - Ambil dari tabel BENEFACTORS.
   - Jika NULL, tampilkan sebagai 'ANONYMOUS'.

2. Kumulatif Tahunan (Running Total):
   - Hitung total donasi yang terus bertambah untuk setiap donatur.
   - Hitungan wajib RESET setiap kali berganti TAHUN atau berganti NAMA.
   - Urutan akumulasi berdasarkan ID donasi.

3. Persentase Kontribusi:
   - Hitung (Nominal Baris / Total Donasi Tahun Tersebut) * 100.
   - Gunakan pembulatan 2 angka di belakang koma.

4. Urutan Laporan:
   - Urutkan berdasarkan: TAHUN (ASC), NAMA (ASC), lalu ID (ASC).
*/

SELECT 
    D.YEAR,
    COALESCE(B.NAME, 'ANONYMOUS') AS BENEFACTOR_NAMES,
    D.AMOUNT,
    SUM(D.AMOUNT) OVER(PARTITION BY D.YEAR, COALESCE(B.NAME, 'ANONYMOUS') ORDER BY D.ID) AS CUMULATIVE_BY_NAME,
    ROUND((D.AMOUNT * 100.0) / SUM(D.AMOUNT) OVER(PARTITION BY D.YEAR), 2) AS PERCENTAGE_OF_YEARLY_TOTAL
FROM DONATIONS D
LEFT JOIN BENEFACTORS B ON D.BENEFACTORID = B.ID
ORDER BY D.YEAR ASC, B.NAME ASC, D.ID ASC;
