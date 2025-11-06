# Laporan Praktikum

**Gilang Purnomo** / **14** / **2341720042** / **TI-3F**

# Praktikum 1: Mengunduh Data dari Web Service (API)

## Langkah 1: Buat Project Baru

Buatlah sebuah project flutter baru dengan nama books di folder src week-11 repository GitHub Anda.

Kemudian Tambahkan dependensi `http` dengan mengetik perintah berikut di terminal.

```dart
flutter pub add http
```

## Langkah 2: Cek file pubspec.yaml

Jika berhasil install plugin, pastikan plugin http telah ada di file pubspec ini seperti berikut.

<p align = "left">
    <img src = "img\prak1_langkah2.png" alt = "Output" width = "300"/>
</p>

## Langkah 3: Buka file main.dart

Ketiklah kode seperti berikut ini.

**Soal 1**

Tambahkan nama panggilan Anda pada `title` app sebagai identitas hasil pekerjaan Anda.

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
      title: 'Praktikum Gilangp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future - Gilangp')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: Text('Go!')),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
```

## Langkah 4: Tambah method getData()

Tambahkan method ini ke dalam `class _FuturePageState` yang berguna untuk mengambil data dari API Google Books.

```dart
Future<Response> getData() async {
  const authority = 'www.googleapis.com';
  const path = '/books/v1/volumes/OVgsEAAAQBAJ';
  Uri url = Uri.https(authority, path);
  return http.get(url);
}
```

**Saol 2**

- Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel `path` di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.

<p align = "center">
    <img src = "img\soal2_1.png" alt = "Output" width = "700"/>
</p>

- Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan capture milik Anda dan tulis di `README` pada laporan praktikum. Lalu lakukan commit dengan pesan **"W11: Soal 2"**.

<p align = "center">
    <img src = "img\soal2_2.png" alt = "Output" width = "700"/>
</p>

## Langkah 5: Tambah kode di ElevatedButton

Tambahkan kode pada `onPressed` di `ElevatedButton` seperti berikut.

```dart
ElevatedButton(
  onPressed: () {
    setState(() {});
    getData()
        .then((value) {
          result = value.body.toString().substring(0, 450);
          setState(() {});
        })
        .catchError((_) {
          result = 'An error occurred';
          setState(() {});
        });
  },
  child: Text('Go!'),
),
```

Lakukan run aplikasi Flutter Anda. Anda akan melihat tampilan akhir seperti gambar berikut. Jika masih terdapat error, silakan diperbaiki hingga bisa running.

**Soal 3**

- Jelaskan maksud kode langkah 5 tersebut terkait `substring` dan `catchError`!

    Jawab: Pada langkah 5, fungsi `substring(0,450)` digunakan untuk menampilkan hanya sebagian (450 karakter pertama) dari data JSON yang dikembalikan oleh API agar tampilan tidak terlalu panjang.

    Sedangkan `catchError` berfungsi untuk menangani kesalahan saat proses pengambilan data, seperti koneksi internet gagal atau URL salah, agar aplikasi tidak crash dan menampilkan pesan error yang sesuai.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan **"W11: Soal 3"**.

<p align = "center">
    <img src = "img\outputprak1.gif" alt = "Output" width = "500"/>
</p>

# Praktikum 2: Menggunakan await/async untuk menghindari callbacks

## Langkah 1: Buka file main.dart

Tambahkan tiga method berisi kode seperti berikut di dalam class _FuturePageState.

```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

## Langkah 2: Tambah method count()

Lalu tambahkan lagi method ini di bawah ketiga method sebelumnya.

```dart
Future count() async {
  int total = 0;
  total = await returnOneAsync();
  total += await returnTwoAsync();
  total += await returnThreeAsync();
  setState(() {
    result = total.toString();
  });
}
```

## Langkah 3: Panggil count()

Lakukan comment kode sebelumnya, ubah isi kode `onPressed()` menjadi seperti berikut.

```dart
ElevatedButton(
  child: Text('Go!'),
      onPressed: () {
         count();
      }
)
```

## Langkah 4: Run

Akhirnya, run atau tekan F5 jika aplikasi belum running. Maka Anda akan melihat seperti gambar berikut, hasil angka 6 akan tampil setelah delay 9 detik.

**Soal 4**

- Jelaskan maksud kode langkah 1 dan 2 tersebut!

    - Pada langkah 1, terdapat tiga fungsi asynchronous (`returnOneAsync`, `returnTwoAsync`, dan `returnThreeAsync`) yang masing-masing menunggu selama 3 detik sebelum mengembalikan nilai 1, 2, dan 3. Fungsi ini mensimulasikan proses asynchronous seperti pengambilan data dari server yang memerlukan waktu.

    - Pada langkah 2, fungsi `count()` menggunakan `await` untuk memanggil ketiga fungsi tersebut secara berurutan, menunggu tiap fungsi selesai sebelum lanjut ke yang berikutnya. Setelah ketiganya selesai, hasilnya dijumlahkan (`1 + 2 + 3 = 6`) dan diperbarui ke tampilan melalui `setState()`. Karena tiap proses memerlukan 3 detik, maka hasil muncul setelah sekitar 9 detik.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan **"W11: Soal 4"**.

<p align = "center">
    <img src = "img\outputprak2.gif" alt = "Output" width = "500"/>
</p>

# Praktikum 3: Menggunakan Completer di Future

## Langkah 1: Buka main.dart

Pastikan telah impor package async berikut.

```dart
import 'package:async/async.dart';
```

## Langkah 2: Tambahkan variabel dan method

Tambahkan variabel late dan method di `class _FuturePageState` seperti ini.

```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}
```

## Langkah 3: Ganti isi kode onPressed()

Tambahkan kode berikut pada fungsi `onPressed()`. Kode sebelumnya bisa Anda comment.

```dart
getNumber().then((value) {
  setState(() {
    result = value.toString();
  });
});
```

## Langkah 4:

Terakhir, **run** atau tekan **F5** untuk melihat hasilnya jika memang belum running. Bisa juga lakukan **hot restart** jika aplikasi sudah running. Maka hasilnya akan seperti gambar berikut ini. Setelah 5 detik, maka angka 42 akan tampil.

<p align = "center">
    <img src = "img\outputprak3_1.gif" alt = "Output" width = "500"/>
</p>

**Soal 5**

- Jelaskan maksud kode langkah 2 tersebut!

  Pada langkah 2, kode menggunakan Completer untuk membuat dan mengontrol sebuah Future secara manual. Fungsi `getNumber()` membuat objek `Completer` baru dan memanggil `calculate()` yang akan menunda proses selama 5 detik. Setelah delay selesai, `completer.complete(42)` dipanggil untuk menyelesaikan Future dengan nilai 42.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan **"W11: Soal 5"**.

## Langkah 5: Ganti method calculate()

Gantilah isi code method `calculate()` seperti kode berikut, atau Anda dapat membuat `calculate2()`

```dart
Future calculate() async {
  try {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
  } catch (e) {
    completer.completeError(e);
  }
}
```

## Langkah 6: Pindah ke onPressed()

Ganti menjadi kode seperti berikut.

```dart
getNumber().then((value) {
  setState(() {
    result = value.toString();
  });
}).catchError((e) {
  result = 'An error occurred';
});
```

**Soal 6**
- Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!

  Pada langkah 2, kode hanya menggunakan `Completer` untuk menyelesaikan Future dengan satu kondisi berhasil (`complete(42)`), tanpa penanganan error. Sedangkan pada langkah 5–6, kode menambahkan  `try–catch` agar proses `calculate()` bisa menangani error dengan aman. Jika terjadi error, `completer.completeError(e)` dijalankan, dan hasilnya dapat ditangkap oleh `.catchError()` pada bagian onPressed(). Dengan cara itu, aplikasi menjadi lebih aman dan tangguh, karena tetap bisa menampilkan pesan kesalahan tanpa membuat program berhenti.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan **"W11: Soal 6"**.

<p align = "center">
    <img src = "img\outputprak3_2.gif" alt = "Output" width = "500"/>
</p>

# Praktikum 4: Memanggil Future secara paralel

Ketika Anda membutuhkan untuk menjalankan banyak Future secara bersamaan, ada sebuah class yang dapat Anda gunakan yaitu: `FutureGroup`.

FutureGroup tersedia di package `async`, yang mana itu harus diimpor ke file dart Anda, seperti berikut.

```dart
import 'package:async/async.dart';
```

## Langkah 1: Buka file main.dart

Tambahkan method ini ke dalam `class _FuturePageState`

```dart
Future returnFG() async {
  FutureGroup<int> futureGroup = FutureGroup<int>();
  futureGroup.add(returnOneAsync());
  futureGroup.add(returnTwoAsync());
  futureGroup.add(returnThreeAsync());
  futureGroup.close();
  final futures = await futureGroup.future;
  int total = 0;
  for (var num in futures) {
    total += num;
  }
  setState(() {
    result = total.toString();
  });
}
```

## Langkah 2: Edit onPressed()

Anda bisa hapus atau comment kode sebelumnya, kemudian panggil method dari langkah 1 tersebut.

```dart
onPressed: () {
  returnFG();
}
```

## Langkah 3: Run

Anda akan melihat hasilnya dalam 3 detik berupa angka 6 lebih cepat dibandingkan praktikum sebelumnya menunggu sampai 9 detik.

**Soal 7**

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan **"W11: Soal 7"**.

<p align = "center">
    <img src = "img\outputprak4_1.gif" alt = "Output" width = "500"/>
</p>

## Langkah 4: Ganti variabel futureGroup

Anda dapat menggunakan FutureGroup dengan `Future.wait` seperti kode berikut.

```dart
final futures = Future.wait<int>([
  returnOneAsync(),
  returnTwoAsync(),
  returnThreeAsync(),
]);
```

**Soal 8**

- Jelaskan maksud perbedaan kode langkah 1 dan 4!

  Perbedaan antara langkah 1 dan langkah 4 adalah pada cara mengelola kumpulan Future.

    - Pada langkah 1, digunakan `FutureGroup`dari package `async`, yang memberi fleksibilitas lebih, misalnya bisa menambahkan Future secara dinamis sebelum `close()`.

    - Pada langkah 4, digunakan `Future.wait`, yaitu fitur bawaan Dart yang langsung menunggu beberapa Future sekaligus tanpa perlu `add()` atau `close()`.

  Keduanya sama-sama menjalankan Future secara paralel, namun `FutureGroup` lebih cocok ketika jumlah Future tidak tetap atau dinamis, sedangkan `Future.wait` lebih sederhana dan efisien untuk daftar Future yang sudah pasti jumlahnya.

<p align = "center">
    <img src = "img\outputprak4_2.gif" alt = "Output" width = "500"/>
</p>