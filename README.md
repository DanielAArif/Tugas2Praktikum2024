# Tugas Pertemuan 2

Fork dan clone repository ini, lalu jalankan perintah 
```
flutter pub get
```
Buatlah tampilan form yang berisi nama, nim, dan tahun lahir pada file `ui/form_data.dart`, lalu buatlah tampilan hasil dari input data tersebut pada file `ui/tampil_data.dart`

JELASKAN PROSES PASSING DATA DARI FORM MENUJU TAMPILAN DENGAN FILE `README.md`

Buat tampilan semenarik mungkin untuk dilihat.


Nama : ___

NIM : ___

Shift Baru: ___

## Screenshot
Contoh :
![Lampiran Form](form.png)
![Lampiran Hasil](hasil.png)

Proses Passing Data dari file Form menuju file Tampilan:
1. Melakukan input data di file form_data.dart:
Pada file form_data.dart, terdapat tiga TextField untuk menginputkan nama, NIM, dan tahun lahir yang masing-masing disimpan dalam variabel kontrol, yaitu _namaController, _nimController, dan _tahunController.
Ketika tombol Simpan ditekan, data yang diinput diambil dari controller dengan perintah "text" dan dikonversi menjadi tipe data yang sesuai.
2. Proses navigasi dan passing data:
Setelah data diambil dari inputan pengguna, langkah selanjutnya adalah melakukan navigasi ke halaman "TampilData" dengan menggunakan "Navigator.push". Fungsi "Navigator.push" digunakan untuk berpindah ke halaman baru (dalam hal ini "TampilData") dan juga melakukan passing data ke halaman tersebut.
Pada kode ini, digunakan "MaterialPageRoute" yang memungkinkan untuk mendefinisikan halaman tujuan di dalam builder. Data yang ingin dikirimkan (nama, nim, dan tahun) dilewatkan sebagai parameter ke konstruktor "TampilData". Dengan ini, data yang telah diinputkan pengguna di halaman form_data.dart dikirimkan ke halaman tampil_data.dart.
3. Penerimaan data di file tampil_data.dart
Di tampil_data.dart, data yang dikirim dari halaman sebelumnya diterima melalui konstruktor "TampilData". Konstanta "TampilData" memiliki parameter nama, nim, dan tahun, yang bertipe String dan int, masing-masing didefinisikan sebagai final karena nilainya tidak akan berubah.
4. Menampilkan data:
Setelah data diterima, nilai tersebut digunakan di dalam widget build di halaman TampilData. Yaitu, data nama, NIM, dan tahun dihitung dan ditampilkan dalam kalimat pengenalan di dalam widget "Text".