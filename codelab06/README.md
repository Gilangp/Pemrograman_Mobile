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