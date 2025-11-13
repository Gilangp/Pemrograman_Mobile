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

# Praktikum 5: Multiple stream subscriptions

## Langkah 1: Buka file main.dart

```dart
late StreamSubscription subscription2;
String values = '';
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
      values += '$event -';
    });
  });

  subscription2 = stream.listen((event) {
    setState(() {
      values += '$event -';
    });
  });

  super.initState();
}
```

## Langkah 3: Run

<p align = "left">
    <img src = "img\prak5_1.png" alt = "Output" width = "200"/>
</p>

**Soal 10**

- Jelaskan mengapa error itu bisa terjadi ?

  error tersebut terjadi karena secara default Stream di Dart adalah single-subscription stream, yang berarti hanya satu subscriber yang dapat mendengarkan aliran data dari stream tersebut.
  Ketika Anda mencoba untuk menambahkan subscription kedua ke stream yang sama (stream.listen(...) lagi), maka Dart akan menolak dan menampilkan error “Bad state: Stream has already been listened to”.

## Langkah 4: Set broadcast stream

```dart
@override
void initState() {
  numberStream = NumberStream();
  numberStreamController = numberStream.controller;

  Stream stream = numberStreamController.stream.asBroadcastStream();

  subscription = stream.listen((event) {
    setState(() {
      values += '$event -';
    });
  });

  subscription2 = stream.listen((event) {
    setState(() {
      values += '$event -';
    });
  });

  super.initState();
}
```

## Langkah 5: Edit method build()

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Multiple Stream Subscriptions'),
      titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
      backgroundColor: Colors.blue,
    ),
    body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            values,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          ElevatedButton(
            onPressed: () => addRandomNumber(),
            child: const Text('New Random Number'),
          ),
          ElevatedButton(
            onPressed: () => stopStream(),
            child: const Text('Stop Subscription'),
          ),
        ],
      ),
    ),
  );
}
```

## Langkah 6: Run

<p align = "left">
    <img src = "img\prak5_2.gif" alt = "Output" width = "400"/>
</p>

**Soal 11**

- Jelaskan mengapa hal itu bisa terjadi ?

  karena stream sudah diubah menjadi broadcast stream, yang memungkinkan lebih dari satu subscription mendengarkan data yang sama.
  Setiap kali ada data baru dikirim ke stream (numberStream.addNumberToSink()), semua subscriber yang terdaftar akan menerima event yang sama secara bersamaan.
  Karena ada dua subscription aktif, setiap event (angka baru) diterima dan diproses dua kali, sehingga tampilan teks menampilkan dua hasil yang sama berurutan.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

- Lalu lakukan commit dengan pesan **"W12: Jawaban Soal 10,11"**.

# Praktikum 6: StreamBuilder

## Langkah 1: Buat Project Baru

Buatlah sebuah project flutter baru dengan nama **streambuilder_nama** (beri nama panggilan Anda) di folder week-12/src/ repository GitHub Anda.

## Langkah 2: Buat file baru stream.dart

```dart
class NumberStream {}
```

## Langkah 3: Tetap di file stream.dart

```dart
import 'dart:math';

class NumberStream {
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNum = random.nextInt(10);
      return myNum;
    });
  }
}
```

## Langkah 4: Edit main.dart

```dart
import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: Container(),
    );
  }
}
```

## Langkah 5: Tambah variabel

```dart
late Stream<int> numberStream;
```

## Langkah 6: Edit initState()

```dart
@override
void initState() {
  numberStream = NumberStream().getNumbers();
  super.initState();
}
```

## Langkah 7: Edit method build()

```dart
body: StreamBuilder(
  stream: numberStream,
  initialData: 0,
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      print('Error!');
    }
    if (snapshot.hasData) {
      return Center(
        child: Text(
          snapshot.data.toString(),
          style: const TextStyle(fontSize: 96),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  },
),
```

## Langkah 8: Run

<p align = "center">
    <img src = "img\prak6.gif" alt = "Output" width = "400"/>
</p>

**Soal 12**

- Jelaskan maksud kode pada langkah 3 dan 7 !

  - Langkah 3 
    Membuat stream yang secara periodik (setiap 1 detik) menghasilkan angka acak dari 0 sampai 9 menggunakan Stream.periodic() dan yield*.

  - Langkah 7
    Menggunakan StreamBuilder untuk menampilkan data dari stream ke layar secara reaktif.
    Setiap kali ada data baru di stream, widget StreamBuilder akan memanggil ulang fungsi builder dan memperbarui tampilan teks dengan angka terbaru.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

- Lalu lakukan commit dengan pesan **"W12: Jawaban Soal 12"**.

# Praktikum 7: BLoC Pattern

## Langkah 1: Buat Project Baru

Buatlah sebuah project flutter baru dengan nama **bloc_random_nama** (beri nama panggilan Anda) di folder week-12/src/ repository GitHub Anda. Lalu buat file baru di folder lib dengan nama random_bloc.dart

## Langkah 2: Isi kode random_bloc.dart

```dart
import 'dart:async';
import 'dart:math';
```

## Langkah 3: Buat class RandomNumberBloc()

```dart
class RandomNumberBloc {}
```

## Langkah 4: Buat variabel StreamController

```dart
class RandomNumberBloc {
  // StreamController untuk input event
  final _generateRandomController = StreamController<void>();

  // StreamController untuk output data
  final _randomNumberController = StreamController<int>();

  // Input Sink (event)
  Sink<void> get generateRandom => _generateRandomController.sink;

  // Output Stream (data)
  Stream<int> get randomNumber => _randomNumberController.stream;
}
```

## Langkah 5: Buat constructor

```dart
RandomNumberBloc() {
  _generateRandomController.stream.listen((_) {
    final random = Random().nextInt(10); // angka acak 0–9
    _randomNumberController.sink.add(random);
  });
}
```

## Langkah 6: Buat method dispose()

```dart
void dispose() {
  _generateRandomController.close();
  _randomNumberController.close();
}
```

## Langkah 7: Edit main.dart

```dart
import 'package:flutter/material.dart';
import 'random_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RandomScreen(),
    );
  }
}
```

## Langkah 8: Buat file baru random_screen.dart

```dart
random_screen.dart
```

## Langkah 9: Lakukan impor material dan random_bloc.dart

```dart
import 'package:flutter/material.dart';
import 'random_bloc.dart';
```

## Langkah 10: Buat StatefulWidget RandomScreen

```dart
class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}
```

## Langkah 11: Buat variabel

```dart
class _RandomScreenState extends State<RandomScreen> {
  final _bloc = RandomNumberBloc();
```

## Langkah 12: Buat method dispose()

```dart
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
```

## Langkah 13: Edit method build()

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Number')),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Random Number: ${snapshot.data}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.generateRandom.add(null),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
```

Run aplikasi, maka Anda akan melihat angka acak antara angka 0 sampai 9 setiap kali menekan tombol `FloactingActionButton`.

<p align = "center">
    <img src = "img\prak7.gif" alt = "Output" width = "400"/>
</p>

**Soal 13**

- Jelaskan maksud praktikum ini ! Dimanakah letak konsep pola BLoC-nya ?

  Praktikum ini untuk menunjukkan bagaimana logika bisnis (proses menghasilkan angka acak) dipisahkan dari tampilan UI menggunakan pola BLoC.

  - Letak konsep BLoC:

    - File random_bloc.dart adalah inti BLoC: menangani input (event) dan output (stream data).

    - StreamController digunakan untuk mengelola aliran data antar lapisan.

    - UI (random_screen.dart) hanya mendengarkan stream melalui StreamBuilder dan tidak tahu bagaimana data dihasilkan.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

- Lalu lakukan commit dengan pesan **"W12: Jawaban Soal 13"**.