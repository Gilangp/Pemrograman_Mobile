# Laporan Praktikum

**Gilang Purnomo** / **14** / **2341720042** / **TI-3F**

## Praktikum Menerapkan Plugin di Project Flutter

**Langkah 1: Buat Project Baru**

Buatlah sebuah project flutter baru dengan nama **flutter_plugin_pubdev**. Lalu jadikan repository di GitHub Anda dengan nama **flutter_plugin_pubdev**.

**Langkah 2: Menambahkan Plugin**

Tambahkan plugin `auto_size_text` menggunakan perintah berikut di terminal

```dart
flutter pub add auto_size_text
```

Jika berhasil, maka akan tampil nama plugin beserta versinya di file `pubspec.yaml` pada bagian dependencies.

<p align = "center">
    <img src = "img\Langkah2.png" alt = "Output" width = "600"/>
</p>

depedencies

<p align = "center">
    <img src = "img\Langkah2_1.png" alt = "Output" width = "600"/>
</p>

**Langkah 3: Buat file red_text_widget.dart**

Buat file baru bernama `red_text_widget.dart` di dalam folder lib lalu isi kode seperti berikut.

```dart
import 'package:flutter/material.dart';

class RedTextWidget extends StatelessWidget {
  const RedTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

**Langkah 4: Tambah Widget AutoSizeText**

Masih di file `red_text_widget.dart`, untuk menggunakan plugin `auto_size_text`, ubahlah kode `return Container()` menjadi seperti berikut.

```dart
return AutoSizeText(
      text,
      style: const TextStyle(color: Colors.red, fontSize: 14),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
);
```

Setelah Anda menambahkan kode di atas, Anda akan mendapatkan info error. Mengapa demikian? Jelaskan dalam laporan praktikum Anda!

Jawab: 
Ada 2 penyebab error

1. AutoSizeText belum dikenali karena belum melakukan import dari `auto_size_text`
2. `text` belum dikenali karena belum didefinisikan variabelnya.

**Langkah 5: Buat Variabel text dan parameter di constructor**

Tambahkan variabel `text` dan parameter di constructor seperti berikut.

```dart
final String text;

const RedTextWidget({Key? key, required this.text}) : super(key: key);
```

**Langkah 6: Tambahkan widget di main.dart**

Buka file `main.dart` lalu tambahkan di dalam `children: `pada `class _MyHomePageState`

```dart
Container(
   color: Colors.yellowAccent,
   width: 50,
   child: const RedTextWidget(
             text: 'You have pushed the button this many times:',
          ),
),
Container(
    color: Colors.greenAccent,
    width: 100,
    child: const Text(
           'You have pushed the button this many times:',
          ),
),
```

**Run** aplikasi tersebut dengan tekan **F5**, maka hasilnya akan seperti berikut.

<p align = "center">
    <img src = "img\hasil_akhir.png" alt = "Output" width = "600"/>
</p>

# Tugas Praktikum

1. Selesaikan Praktikum tersebut, lalu dokumentasikan dan push ke repository Anda berupa screenshot hasil pekerjaan beserta penjelasannya di file `README.md`!

2. Jelaskan maksud dari langkah 2 pada praktikum tersebut!

    Jawab: untuk menambahkan plugin `auto_size_text` ke dalam Flutter agar dapat menggunakan widget AutoSizeText. Perintah `flutter pub add auto_size_text` akan otomatis menambahkan plugin ke bagian dependencies di file pubspec.yaml.

3. Jelaskan maksud dari langkah 5 pada praktikum tersebut!

    Jawab: untuk menambahkan variabel `text` sebagai penampungan data teks yang akan ditampilkan, serta membuat parameter pada constructor agar nilai dari teks dapat dikirim saat widget dipanggil. Jadi, widget RedTextWidget menjadi lebih fleksibel karena bisa menampilkan teks yang berbeda sesuai data/nilai yang diberikan.

4. Pada langkah 6 terdapat dua widget yang ditambahkan, jelaskan fungsi dan perbedaannya!

    Jawab: 
    * Widget pertama menggunakan `RedTextWidget`, yaitu widget kustom yang menampilkan teks berwarna merah dengan ukuran otomatis menyesuaikan ruang tampilnya.
    * Widget kedua menggunakan `Text` biasa dari Flutter, yang menampilkan teks dengan warna dan ukuran default tanpa penyesuaian otomatis.

    Jadi, perbedaannya terletak pada penggunaan widget kustom (`RedTextWidget`) yang memiliki gaya teks khusus, sedangkan widget `Text` hanya menampilkan teks standar.

5. Jelaskan maksud dari tiap parameter yang ada di dalam plugin `auto_size_text` berdasarkan tautan pada dokumentasi ini !

    jawab:  Plugin `auto_size_text` digunakan untuk menampilkan teks yang secara otomatis menyesuaikan ukuran font agar sesuai dengan ruang tampilannya.  
    Berikut penjelasan dari tiap parameter penting berdasarkan dokumentasi resmi:

    ## Parameter Utama

    | Parameter | Tipe Data | Penjelasan |
    |------------|------------|------------|
    | **`text`** | `String` | Teks yang akan ditampilkan pada layar. |
    | **`style`** | `TextStyle?` | Mengatur tampilan teks seperti warna, ukuran, jenis huruf, dan ketebalan. |
    | **`minFontSize`** | `double` | Ukuran font minimum ketika teks menyesuaikan agar tetap muat. |
    | **`maxFontSize`** | `double` | Ukuran font maksimum yang digunakan sebelum teks diperkecil. |
    | **`stepGranularity`** | `double` | Mengatur tingkat perubahan ukuran font setiap kali teks menyesuaikan (semakin kecil nilainya, semakin halus penyesuaiannya). |
    | **`maxLines`** | `int?` | Jumlah baris maksimum teks yang ditampilkan. Jika lebih, teks akan dipotong. |
    | **`overflow`** | `TextOverflow` | Menentukan cara menangani teks yang terlalu panjang, misalnya dengan menampilkan tanda elipsis (`...`). |
    | **`textAlign`** | `TextAlign` | Mengatur perataan teks seperti kiri, kanan, tengah, atau rata penuh. |
    | **`textDirection`** | `TextDirection` | Menentukan arah teks, misalnya dari kiri ke kanan (`ltr`) atau kanan ke kiri (`rtl`). |
    | **`softWrap`** | `bool` | Menentukan apakah teks boleh berpindah ke baris baru saat melebihi lebar kontainer. |
    | **`overflowReplacement`** | `Widget?` | Widget pengganti yang ditampilkan jika teks tidak muat di area yang disediakan. |

6. Kumpulkan laporan praktikum Anda berupa link repository GitHub kepada dosen!