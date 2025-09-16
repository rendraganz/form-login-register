# Form Login dan Register Interaktif
### MUHAMMAD RENDRA IRAWAN | 362458302036

## Implementasi Kode Flutter
- Kode main.dart
![kode main](media/main.png)

- Kode data/user.dart
![kode user_data](media/user_data.png)

- Kode register_page.dart
![kode register](media/register_1.png)
![kode register](media/register_2.png)
![kode register](media/register_3.png)
![kode register](media/register_4.png)

- Kode login_page.dart
![kode login](media/login_1.png)
![kode login](media/login_2.png)
![kode login](media/login_3.png)
![kode login](media/login_4.png)

- Kode home_page.dart
![kode home_page](media/home_1.png)
![kode home_page](media/home_2.png)

## Debuging
- Halaman Login
![home](media/page_login.png)
- Halaman Register
![register](media/page_register.png)
- Halaman Home
![home](media/page_home.png)

## Latihan Tambahan
- Menambahkan validasi input untuk memastikan format email benar mengandung "@" dan minimal password 8 karakter.

tambahkan kode ini pada file login.dart dan register.dart, dalam register() dan login().
![validasi input](media/validasi_input.png)

- Menambah ikon mata agar bisa menampilkan/menyembunyikan password.

tambahkan kode ini pada file login.dart dan register.dart.

tambahkan state

![state](media/state.png)

ganti TextField

![hide_pw](media/hide_password.png)

- Menambah Hero Widget.
Tempatkan di login_page.dart & register_page.dart pada Icon()

Pada login.dart

![hero_widget](media/hero_login.png)

Pada register.dart

![hero_widget](media/hero_register.png)

- Menyimpan sesi login.

- Menambah dependensi di pubspec

![dependensi](media/dependensi_pub.png)

- Di login.dart impor prefs

![login](media/sesiLogin_login.png)

lalu, tambah kode berikut

![login](media/sesiLogin_login_2.png)
![login](media/sesiLogin_login_3.png)

- Di main.dart, cek saat pertama kali app dijalankan
![login](media/sesiLogin_main.png)

![login](media/sesiLogin_main_2.png)

- Di home_page.dart, tambahkan logout agar sesi dihapus:
![login](media/sesiLogin_home.png)
![login](media/sesiLogin_home_2.png)


## Hasil akhir

- Halaman Register dengan  Validasi input
- Password terlihat
![validasi dan hide pw](media/register_tampil.png)

- Password sembunyi
![validasi dan hide pw](media/register_tutup.png)

- Validasi ketika password kurang
![validasi dan hide pw](media/register_kurang.png)

- Halaman Login
![halaman login](media/login_page.png)

- Halaman Home
![halaman home](media/home_page_2.png)

Terimakasih

