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

# Praktikum 2: Stream controllers dan sinks

## Langkah 1: Buka file stream.dart

```dart
import 'dart:async';
```

## Langkah 2: Tambah class NumberStream

```dart
class NumberStream {
}
```

## Langkah 3: Tambah StreamController

```dart
final StreamController<int> controller = StreamController<int>();
```

## Langkah 4: Tambah method addNumberToSink

```dart
void addNumberToSink(int newNumber) {
  controller.sink.add(newNumber);
}
```

## Langkah 5: Tambah method close()

```dart
void close() {
  controller.close();
}
```

## Langkah 6: Buka file main.dart

```dart
import 'dart:async';
import 'dart:math';
```

## Langkah 7: Tambah variabel

```dart
int lastNumber = 0;
late StreamController numberStreamController;
late NumberStream numberStream;
```

## Langkah 8: Edit initState()

```dart
@override
void initState() {
  numberStream = NumberStream();
  numberStreamController = numberStream.controller;

  Stream stream = numberStreamController.stream;

  stream.listen((event) {
    setState(() {
      lastNumber = event;
    });
  });

  super.initState();
}
```

## Langkah 9: Edit dispose()

```dart
@override
void dispose() {
  numberStreamController.close();
  super.dispose();
}
```

## Langkah 10: Tambah method addRandomNumber()

```dart
void addRandomNumber() {
  Random random = Random();
  int myNum = random.nextInt(10);
  numberStream.addNumberToSink(myNum);
}
```

## Langkah 11: Edit method build()

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Stream Controller Example'),
      centerTitle: true,
    ),
    body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            lastNumber.toString(),
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () => addRandomNumber(),
            child: const Text('New Random Number'),
          ),
        ],
      ),
    ),
  );
}
```

## Langkah 12: Run

<p align = "center">
    <img src = "img\prak2.gif" alt = "Output" width = "400"/>
</p>

**Soal 6**

- Jelaskan maksud kode langkah 8 dan 10 tersebut!

  - Langkah 8 (initState):

    Pada langkah ini, aplikasi membuat instance NumberStream dan mengambil controller-nya.
    Kemudian dibuat listener untuk mendengarkan setiap event baru dari stream.
    Setiap kali data baru masuk ke stream, setState() dipanggil agar tampilan lastNumber diperbarui di layar.
    Dengan kata lain, langkah ini menghubungkan data stream ke UI aplikasi.

  - Langkah 10 (addRandomNumber):

    Fungsi ini digunakan untuk membuat angka acak antara 0–9 menggunakan Random(), lalu angka tersebut dikirimkan ke dalam stream melalui addNumberToSink().
    Sehingga setiap kali tombol ditekan, nilai baru akan “mengalir” ke stream dan langsung ditampilkan di UI.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

- Lalu lakukan commit dengan pesan **"W12: Jawaban Soal 6"**.

## Langkah 13: Buka stream.dart

```dart
void addError() {
  controller.sink.addError('error');
}
```

## Langkah 14: Buka main.dart

```dart
@override
void initState() {
  numberStream = NumberStream();
  numberStreamController = numberStream.controller;

  Stream stream = numberStreamController.stream;

  stream.listen((event) {
    setState(() {
      lastNumber = event;
    });
  }).onError((error) {
    setState(() {
      lastNumber = -1;
    });
  });

  super.initState();
}
```

## Langkah 15: Edit method addRandomNumber()

```dart
void addRandomNumber() {
  Random random = Random();
  // int myNum = random.nextInt(10);
  // numberStream.addNumberToSink(myNum);
  numberStream.addError(); // kirim event error ke stream
}
```

**Soal 7**

- Jelaskan maksud kode langkah 13 sampai 15 tersebut!

  - Langkah 13:

    Menambahkan method addError() di class NumberStream agar dapat mengirimkan event error melalui stream menggunakan controller.sink.addError().

  - Langkah 14:

    Menambahkan penanganan error (onError) pada listener di initState().
    Saat stream mengirim event error, kode di dalam onError() akan dijalankan dan mengubah lastNumber menjadi -1.
    Ini membuat UI tetap responsif dan dapat menampilkan tanda bahwa terjadi error.

  - Langkah 15:

    Mengubah fungsi addRandomNumber() agar tidak lagi mengirim angka acak, melainkan mengirim error ke stream dengan memanggil addError().
    Dengan demikian, kita bisa menguji bagaimana aplikasi menangani error dari aliran data (stream).

- Kembalikan kode seperti semula pada Langkah 15, comment `addError()` agar Anda dapat melanjutkan ke praktikum 3 berikutnya.

- Lalu lakukan commit dengan pesan **"W12: Jawaban Soal 7"**.

# Praktikum 3: Injeksi data ke streams

## Langkah 1: Buka main.dart

```dart
late StreamTransformer transformer;
```

## Langkah 2: Tambahkan kode ini di initState

```dart
transformer = StreamTransformer<int, int>.fromHandlers(
  handleData: (value, sink) {
    sink.add(value * 10);
  },
  handleError: (error, trace, sink) {
    sink.add(-1);
  },
  handleDone: (sink) => sink.close(),
);
```

## Langkah 3: Tetap di initState

```dart
stream.transform(transformer).listen((event) {
  setState(() {
    lastNumber = event;
  });
}).onError((error) {
  setState(() {
    lastNumber = -1;
  });
});
super.initState();
```

## Langkah 4: Run

<p align = "center">
    <img src = "img\prak3.gif" alt = "Output" width = "400"/>
</p>

**Soal 8**

- Jelaskan maksud kode langkah 1-3 tersebut!

  - Langkah 1 – StreamTransformer digunakan untuk memodifikasi data yang mengalir di dalam stream sebelum diterima UI.
  Dengan deklarasi StreamTransformer<int, int>, kita mengubah stream yang mengirimkan angka integer.

  - Langkah 2 – Dalam fromHandlers, terdapat tiga handler:

      - handleData: menerima data asli dari stream, lalu mengalikan setiap nilai dengan 10 sebelum diteruskan ke sink.

      - handleError: jika stream mengirim error, nilai -1 akan dikirim sebagai penanda error.

      - handleDone: menutup sink ketika stream selesai.

  - Langkah 3 – Stream yang sudah ditransformasi (stream.transform(transformer)) di-listen, sehingga UI akan menerima data yang sudah dimodifikasi (misalnya 3 → 30).
  Jika terjadi error, lastNumber akan diubah menjadi -1.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

- Lalu lakukan commit dengan pesan **"W12: Jawaban Soal 8"**.

# Praktikum 4: Subscribe ke stream events

## Langkah 1: Tambah variabel

```dart
late StreamSubscription subscription;
```

## Langkah 2: Edit initState()

```dart
@override
void initState() {
  numberStream = NumberStream();
  numberStreamController = numberStream.controller;
  Stream stream = numberStreamController.stream;

  subscription = stream.listen((event) {
    setState(() {
      lastNumber = event;
    });
  });

  super.initState();
}
```

## Langkah 3: Tetap di initState()

```dart
subscription.onError((error) {
  setState(() {
    lastNumber = -1;
  });
});
```

## Langkah 4: Tambah properti onDone()

```dart
subscription.onDone(() {
  print('OnDone was called');
});
```

## Langkah 5: Tambah method baru

```dart
void stopStream() {
  numberStreamController.close();
}
```

## Langkah 6: Pindah ke method dispose()

```dart
@override
void dispose() {
  subscription.cancel();
  super.dispose();
}
```

## Langkah 7: Pindah ke method build()

```dart
ElevatedButton(
  onPressed: () => stopStream(),
  child: const Text('Stop Subscription'),
),
```

## Langkah 8: Edit method addRandomNumber()

```dart
void addRandomNumber() {
  Random random = Random();
  int myNum = random.nextInt(10);

  if (!numberStreamController.isClosed) {
    numberStream.addNumberToSink(myNum);
  } else {
    setState(() {
      lastNumber = -1;
    });
  }
}
```

## Langkah 9: Run

<p align = "center">
    <img src = "img\prak4_1.gif" alt = "Output" width = "400"/>
</p>

## Langkah 10: Tekan button ‘Stop Subscription'

<p align = "left">
    <img src = "img\prak4_2.png" alt = "Output" width = "200"/>
</p>

**Soal 9**

- Jelaskan maksud kode langkah 2, 6 dan 8 tersebut!

  - Langkah 2

    Pada langkah ini, kita membuat subscription ke stream menggunakan listen().
    Subscription ini mendengarkan setiap event (data baru) yang dikirimkan oleh stream dan menampilkannya di UI dengan setState().

  - Langkah 6

    Di method dispose(), dilakukan pemanggilan subscription.cancel() agar berhenti mendengarkan stream ketika widget dihancurkan.
    Tujuannya untuk menghindari memory leak karena stream yang masih aktif setelah widget ditutup.

  - Langkah 8

    Pada langkah ini, dilakukan pengecekan if (!numberStreamController.isClosed) sebelum menambah data baru.
    Hal ini mencegah error saat mencoba menambahkan data ke stream yang sudah ditutup.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

- Lalu lakukan commit dengan pesan **"W12: Jawaban Soal 9"**.