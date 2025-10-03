# Tugas Praktikum

**Gilang Purnomo** / **14** / **2341720042** / **TI-3F**

## Praktikum 1: Membangun Layout di Flutter

**Langkah 1: Buat Project Baru**

Buatlah sebuah project flutter baru dengan nama layout_flutter. Atau sesuaikan style laporan praktikum yang Anda buat.

**Langkah 2: Buka file lib/main.dart**

Buka file `main.dart` lalu ganti dengan kode berikut. Isi nama dan NIM Anda di `text title`.

<p align = "center">
    <img src = "img\Prak1_Langkah2.png" alt = "Output" width = "600"/>
</p>

**Langkah 3: Identifikasi layout diagram**

Langkah pertama adalah memecah tata letak menjadi elemen dasarnya:

    - Identifikasi baris dan kolom.
    - Apakah tata letaknya menyertakan kisi-kisi (grid)?
    - Apakah ada elemen yang tumpang tindih?
    - Apakah UI memerlukan tab?
    - Perhatikan area yang memerlukan alignment, padding, atau borders.

**Langkah 4: Implementasi title row**

/* soal 1 */ Letakkan widget `Column` di dalam widget `Expanded` agar menyesuaikan ruang yang tersisa di dalam widget `Row`. Tambahkan properti `crossAxisAlignment` ke `CrossAxisAlignment`.start sehingga posisi kolom berada di awal baris.

/* soal 2 */ Letakkan baris pertama teks di dalam `Container` sehingga memungkinkan Anda untuk menambahkan padding = 8. Teks `Batu, Malang, Indonesia` di dalam `Column`, set warna menjadi abu-abu.

/* soal 3 */ Dua item terakhir di baris judul adalah ikon bintang, set dengan warna merah, dan teks "41". Seluruh baris ada di dalam `Container` dan beri padding di sepanjang setiap tepinya sebesar 32 piksel. Kemudian ganti isi `body text ‘Hello World'` dengan variabel `titleSection` seperti berikut:

<p align = "center">
    <img src = "img\Prak1_langkah4.png" alt = "Output" width = "600"/>
</p>

## Praktikum 2: Implementasi button row

**Langkah 1: Buat method Column _buildButtonColumn**

**Langkah 2: Buat widget buttonSection**

**Langkah 3: Tambah button section ke body**

<p align = "center">
    <img src = "img\Prak2.png" alt = "Output" width = "600"/>
</p>

## Praktikum 3: Implementasi text section

**Langkah 1: Buat widget textSection**

**Langkah 2: Tambahkan variabel text section ke body**

<p align = "center">
    <img src = "img\Prak3.png" alt = "Output" width = "600"/>
</p>

## Praktikum 4: Implementasi image section

**Langkah 1: Siapkan aset gambar**

<p align = "center">
    <img src = "layout_flutter\assets\images\view_gunung.jpg" alt = "Output" width = "600"/>
</p>

**Langkah 2: Tambahkan gambar ke body**

**Langkah 3: Terakhir, ubah menjadi ListView**

<p align = "center">
    <img src = "img\Prak4.png" alt = "Output" width = "600"/>
</p>

## Tugas Praktikum 1

1. Selesaikan Praktikum 1 sampai 4, lalu dokumentasikan dan push ke repository Anda berupa screenshot setiap hasil pekerjaan beserta penjelasannya di file `README.md`!

2. Silakan implementasikan di project baru "basic_layout_flutter" dengan mengakses sumber ini: 
https://docs.flutter.dev/codelabs/layout-basics

<p align = "center">
    <img src = "img\tugasprak.png" alt = "Output" width = "600"/>
</p>

3. Kumpulkan link commit repository GitHub Anda kepada dosen yang telah disepakati!

## Praktikum 5: Membangun Navigasi di Flutter

**Langkah 1: Siapkan project baru**

Sebelum melanjutkan praktikum, buatlah sebuah project baru Flutter dengan nama **belanja** dan susunan folder seperti pada gambar berikut. Penyusunan ini dimaksudkan untuk mengorganisasi kode dan widget yang lebih mudah.

<p align = "center">
    <img src = "img\Prak5_Langkah1.png" alt = "Output" width = "200"/>
</p>

**Langkah 2: Mendefinisikan Route**

Buatlah dua buah file dart dengan nama `home_page.dart` dan `item_page.dart` pada folder **pages**. Untuk masing-masing file, deklarasikan `class HomePage` pada file `home_page.dart` dan `ItemPage` pada `item_page.dart`. Turunkan class dari `StatelessWidget`. Gambaran potongan kode dapat anda lihat sebagai berikut.

**Langkah 3: Lengkapi Kode di main.dart**

Setelah kedua halaman telah dibuat dan didefinisikan, bukalah file `main.dart`. Pada langkah ini anda akan mendefinisikan **Route** untuk kedua halaman tersebut. Definisi penamaan **route** harus bersifat **unique**. Halaman **HomePage** didefinisikan sebagai /. Dan halaman **ItemPage** didefinisikan sebagai **/item**. Untuk mendefinisikan halaman awal, anda dapat menggunakan `named argument initialRoute`. Gambaran tahapan ini, dapat anda lihat pada potongan kode berikut.

**Langkah 4: Membuat data model**

Sebelum melakukan perpindahan halaman dari `HomePage` ke `ItemPage`, dibutuhkan proses pemodelan data. Pada desain mockup, dibutuhkan dua informasi yaitu nama dan harga. Untuk menangani hal ini, buatlah sebuah file dengan nama `item.dart` dan letakkan pada folder **models**. Pada file ini didefinisikan pemodelan data yang dibutuhkan. Ilustrasi kode yang dibutuhkan, dapat anda lihat pada potongan kode berikut.

**Langkah 5: Lengkapi kode di class HomePage**

Pada halaman `HomePage` terdapat `ListView` widget. Sumber data `ListView` diambil dari model List dari object Item. Gambaran kode yang dibutuhkan untuk melakukan definisi model dapat anda lihat sebagai berikut.

**Langkah 6: Membuat ListView dan itemBuilder**

Untuk menampilkan `ListView` pada praktikum ini digunakan `itemBuilder`. Data diambil dari definisi model yang telah dibuat sebelumnya. Untuk menunjukkan batas data satu dan berikutnya digunakan widget `Card`. Kode yang telah umum pada bagian ini tidak ditampilkan. Gambaran kode yang dibutuhkan dapat anda lihat sebagai berikut.

**Langkah 7: Menambahkan aksi pada ListView**

<p align = "center">
    <img src = "img\prak5.gif" alt = "Output" width = "600"/>
</p>

## Tugas Praktikum 2

1. Untuk melakukan pengiriman data ke halaman berikutnya, cukup menambahkan informasi arguments pada penggunaan `Navigator`. Perbarui kode pada bagian `Navigator` menjadi seperti berikut.

```dart
Navigator.pushNamed(context, '/item', arguments: item);
```

2. Pembacaan nilai yang dikirimkan pada halaman sebelumnya dapat dilakukan menggunakan `ModalRoute`. Tambahkan kode berikut pada blok fungsi build dalam halaman `ItemPage`. Setelah nilai didapatkan, anda dapat menggunakannya seperti penggunaan variabel pada umumnya. (https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments)

```dart
final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
```

<p align = "center">
    <img src = "img\TG2_1 dan 2.gif" alt = "Output" width = "600"/>
</p>

3. Pada hasil akhir dari aplikasi **belanja** yang telah anda selesaikan, tambahkan atribut foto produk, stok, dan rating. Ubahlah tampilan menjadi `GridView` seperti di aplikasi marketplace pada umumnya.

<p align = "center">
    <img src = "img\TG2_3.gif" alt = "Output" width = "600"/>
</p>

4. Silakan implementasikan `Hero widget` pada aplikasi **belanja** Anda dengan mempelajari dari sumber ini: https://docs.flutter.dev/cookbook/navigation/hero-animations

<p align = "center">
    <img src = "img\TG2_4.gif" alt = "Output" width = "600"/>
</p>

5. Sesuaikan dan modifikasi tampilan sehingga menjadi aplikasi yang menarik. Selain itu, pecah widget menjadi kode yang lebih kecil. Tambahkan **Nama** dan **NIM** di footer aplikasi **belanja** Anda.

6. Selesaikan Praktikum 5: Navigasi dan Rute tersebut. Cobalah modifikasi menggunakan plugin go_router, lalu dokumentasikan dan push ke repository Anda berupa screenshot setiap hasil pekerjaan beserta penjelasannya di file `README.md`. Kumpulkan link commit repository GitHub Anda kepada dosen yang telah disepakati!

<p align = "center">
    <img src = "img\TG2_ 5 dan 6.gif" alt = "Output" width = "600"/>
</p>