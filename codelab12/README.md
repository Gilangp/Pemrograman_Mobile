# Laporan Praktikum

**Gilang Purnomo** / **14** / **2341720042** / **TI-3F**

# Praktikum 1: Dart Streams

## Langkah 1: Buat Project Baru

Buatlah sebuah project flutter baru dengan nama stream_nama (beri nama panggilan Anda) di folder week-12/src/ repository GitHub Anda.

## Langkah 2: Buka file main.dart

Ketiklah kode seperti berikut ini.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Gilangp',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

**Soal 1**
- Tambahkan **nama panggilan Anda** pada `title` app sebagai identitas hasil pekerjaan Anda.
    `title: 'Stream Gilangp',`
- Gantilah warna tema aplikasi sesuai kesukaan Anda.

```dart
    theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
```
- Lakukan commit hasil jawaban Soal 1 dengan pesan **"W12: Jawaban Soal 1"**

## Langkah 3: Buat file baru stream.dart

```dart
import 'package:flutter/material.dart';

class ColorStream {
}
```

## Langkah 4: Tambah variabel colors

```dart
final List<Color> colors = [
  Colors.blueGrey,
  Colors.amber,
  Colors.deepPurple,
  Colors.lightBlue,
  Colors.teal
];
```

**Soal 2**
- Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel `colors` tersebut.

- Lakukan commit hasil jawaban Soal 2 dengan pesan **"W12: Jawaban Soal 2"**

## Langkah 5: Tambah method getColors()

```dart
Stream<Color> getColors() async* {
}
```

## Langkah 6: Tambah perintah yield*

```dart
yield* Stream.periodic(
  const Duration(seconds: 1),
  (int t) {
    int index = t % colors.length;
    return colors[index];
  },
);
```
**Soal 3**

- Jelaskan fungsi keyword `yield*` pada kode tersebut!

  Keyword yield* digunakan untuk meneruskan (delegate) semua data yang dihasilkan dari sebuah stream lain ke dalam stream saat ini.

- Apa maksud isi perintah kode tersebut?

  Parameter `t` adalah penghitung jumlah detik yang telah berlalu sejak stream dimulai.
  Baris `int index = t % colors.length;` memastikan agar pengambilan warna berulang dari awal setelah semua warna habis, karena menggunakan operasi modulus.
  Hasil akhirnya: background warna aplikasi akan berubah otomatis setiap detik, berganti sesuai urutan warna di daftar `colors`.

- Lakukan commit hasil jawaban Soal 3 dengan pesan **"W12: Jawaban Soal 3"**

## Langkah 7: Buka main.dart

```dart
import 'stream.dart';
```

## Langkah 8: Tambah variabel

```dart
Color bgColor = Colors.blueGrey;
late ColorStream colorStream;
```

## Langkah 9: Tambah method changeColor()

```dart
void changeColor() async {
  await for (var eventColor in colorStream.getColors()) {
    setState(() {
      bgColor = eventColor;
    });
  }
}
```

## Langkah 10: Lakukan override initState()

```dart
@override
void initState() {
  super.initState();
  colorStream = ColorStream();
  changeColor();
}
```

## Langkah 11: Ubah isi Scaffold()

```dart
return Scaffold(
  appBar: AppBar(
    title: const Text('Stream'),
  ),
  body: Container(
    decoration: BoxDecoration(color: bgColor),
  ),
);
```

## Langkah 12: Run

<p align = "center">
    <img src = "img\prak1_1.gif" alt = "Output" width = "400"/>
</p>

**Soal 4**
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

- Lakukan commit hasil jawaban Soal 4 dengan pesan **"W12: Jawaban Soal 4"**

## Langkah 13: Ganti isi method changeColor()

```dart
void changeColor() {
  colorStream.getColors().listen((eventColor) {
    setState(() {
      bgColor = eventColor;
    });
  });
}
```

**Soal 5**

- Jelaskan perbedaan menggunakan `listen` dan `await for` (langkah 9) !

  - `await for` digunakan di dalam fungsi async untuk menunggu setiap data stream satu per satu secara berurutan.

  - `listen` digunakan untuk mendaftarkan callback yang akan dijalankan setiap kali ada event baru dari stream, tanpa perlu menunggu atau menghentikan eksekusi fungsi utama.

- Lakukan commit hasil jawaban Soal 5 dengan pesan **"W12: Jawaban Soal 5"**

<p align = "center">
    <img src = "img\prak1_2.gif" alt = "Output" width = "400"/>
</p>