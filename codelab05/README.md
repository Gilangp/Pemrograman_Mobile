# Tugas Praktikum

**Gilang Purnomo** / **14** / **2341720042** / **TI-3F**

## 1. Silakan selesaikan Praktikum 1 sampai 5, lalu dokumentasikan berupa screenshot hasil pekerjaan Anda beserta penjelasannya!

### Praktikum 1: Membuat Project Flutter Baru

**Langkah 1:**

Buka VS Code, lalu tekan tombol **Ctrl + Shift + P** maka akan tampil Command Palette, lalu ketik **Flutter**. Pilih **New** Application **Project**.

**Jawab:**
<p align = "center">
    <img src = "img\Prak_1_langkah 1.png" alt = "Output" width = "600"/>
</p>

**Langkah 2:**

Kemudian buat folder **sesuai style** laporan praktikum yang Anda pilih. Disarankan pada folder dokumen atau desktop atau alamat folder lain yang tidak terlalu dalam atau panjang. Lalu pilih **Select a folder to create the project in**.

**Jawab:**

<p align = "center">
    <img src = "img\Prak_1_langkah2.png" alt = "Output" width = "600"/>
</p>

**Langkah 3:**

Buat nama project flutter **hello_world** seperti berikut, lalu tekan **Enter**. Tunggu hingga proses pembuatan project baru selesai.

**Jawab:**

<p align = "center">
    <img src = "img\Prak_1_langkah3.png" alt = "Output" width = "600"/>
</p>

**Langkah 4:**

Jika sudah selesai proses pembuatan project baru, pastikan tampilan seperti berikut. Pesan akan tampil berupa **"Your Flutter Project is ready!"** artinya Anda telah berhasil membuat project Flutter baru.

**Jawab:**

<p align = "center">
    <img src = "img\Prak_1_langkah4.png" alt = "Output" width = "600"/>
</p>

### Praktikum 2: Menghubungkan Perangkat Android atau Emulator

Melanjutkan dari praktikum 1, Anda diminta untuk menjalankan aplikasi ke perangkat fisik (device Android atau iOS). Silakan ikuti langkah-langkah pada codelab tautan berikut ini.

**Jawab:**

<p align = "center">
    <img src = "img\Prak_2.jpg" alt = "Output" width = "400"/>
</p>

### Praktikum 3: Membuat Repository GitHub dan Laporan Praktikum

**Langkah 1:**

Login ke akun GitHub Anda, lalu buat repository baru dengan nama **"flutter-fundamental-part1"**

**Langkah 2:**

Lalu klik tombol **"Create repository"** lalu akan tampil seperti gambar berikut.

**Langkah 3:**

Kembali ke VS code, project flutter hello_world, buka terminal pada menu **Terminal > New Terminal**. Lalu ketik perintah berikut untuk inisialisasi git pada project Anda.

`git init`

**Langkah 4:**

Pilih menu **Source Control** di bagian kiri, lalu lakukan **stages (+)** pada file **.gitignore** untuk mengunggah file pertama ke repository GitHub.

<p align = "center">
    <img src = "img\Prak_3_Langkah4.png" alt = "Output" width = "300"/>
</p>

**Langkah 5:**

Beri pesan commit **"tambah gitignore"** lalu klik **Commit (✔)**

<p align = "center">
    <img src = "img\Prak_3_Langkah5.png" alt = "Output" width = "300"/>
</p>

**Langkah 6:**

Lakukan push dengan klik bagian menu titik tiga **> Push**

<p align = "center">
    <img src = "img\Prak_3_Langkah6.png" alt = "Output" width = "300"/>
</p>

**Langkah 7:**

Di pojok kanan bawah akan tampil seperti gambar berikut. Klik **"Add Remote"**

**Langkah 8:**

Salin tautan repository Anda dari browser ke bagian ini, lalu klik **Add remote**

Setelah berhasil, tulis remote name dengan **"origin"**

**Langkah 9:**

Lakukan hal yang sama pada file **README.md** mulai dari Langkah 4. Setelah berhasil melakukan push, masukkan username GitHub Anda dan password berupa token yang telah dibuat (pengganti password konvensional ketika Anda login di browser GitHub). Reload halaman repository GitHub Anda, maka akan tampil hasil push kedua file tersebut seperti gambar berikut.

<p align = "center">
    <img src = "img\Prak_3_Langkah9.png" alt = "Output" width = "500"/>
</p>

**Langkah 10:**

Lakukan push juga untuk semua file lainnya dengan pilih **Stage All Changes**. Beri pesan commit **"project hello_world"**. Maka akan tampil di repository GitHub Anda seperti berikut.

<p align = "center">
    <img src = "img\Prak_3_Langkah10.png" alt = "Output" width = "700"/>
</p>

**Langkah 11:**

Kembali ke VS Code, ubah platform di pojok kanan bawah ke emulator atau device atau bisa juga menggunakan browser Chrome. Lalu coba running project **hello_world** dengan tekan **F5** atau **Run > Start Debugging**. Tunggu proses kompilasi hingga selesai, maka aplikasi flutter pertama Anda akan tampil seperti berikut.

<p align = "center">
    <img src = "img\Prak_3_Langkah11.png" alt = "Output" width = "700"/>
</p>

**Langkah 12:**

Silakan screenshot seperti pada Langkah 11, namun teks yang ditampilkan dalam aplikasi berupa nama lengkap Anda. Simpan file screenshot dengan nama **01.png** pada folder **images** (buat folder baru jika belum ada) di project hello_world Anda. Lalu ubah isi README.md seperti berikut, sehingga tampil hasil screenshot pada file README.md. Kemudian push ke repository Anda.

<p align = "center">
    <img src = "img\Prak_3_Langkah12.png" alt = "Output" width = "700"/>
</p>

### Praktikum 4: Menerapkan Widget Dasar

**Langkah 1: Text Widget**

Buat folder baru **basic_widgets** di dalam folder **lib**. Kemudian buat file baru di dalam basic_widgets dengan nama `text_widget.dart`. Ketik atau salin kode program berikut ke project hello_world Anda pada file `text_widget.dart`.

```dart
import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Nama saya Fulan, sedang belajar Pemrograman Mobile",
      style: TextStyle(color: Colors.red, fontSize: 14),
      textAlign: TextAlign.center);
  }
}
```

Lakukan import `file text_widget.dart` ke main.dart, lalu ganti bagian text widget dengan kode di atas. Maka hasilnya seperti gambar berikut. Screenshot hasil milik Anda, lalu dibuat laporan pada file README.md.

Di `main.dart`

<p align = "center">
    <img src = "img\Prak_4_Langkah1,2.png" alt = "Output" width = "700"/>
</p>

**Output:**

<p align = "center">
    <img src = "img\Prak_4_Langkah1.png" alt = "Output" width = "700"/>
</p>

**Langkah 2: Image Widget**

Buat sebuah file `image_widget.dart` di dalam folder basic_widgets dengan isi kode berikut.

```dart
import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("logo_polinema.jpg")
    );
  }
}
```

Lakukan penyesuaian asset pada file `pubspec.yaml` dan tambahkan file logo Anda di folder assets project hello_world.

```
flutter:
  assets:
     - logo_polinema.jpg
```

Jangan lupa sesuaikan kode dan import di file `main.dart` kemudian akan tampil gambar seperti berikut.

<p align = "center">
    <img src = "img\Prak_4_Langkah2.png" alt = "Output" width = "700"/>
</p>

### Praktikum 5: Menerapkan Widget Material Design dan iOS Cupertino

**Langkah 1: Cupertino Button dan Loading Bar**

Buat file di basic_widgets > `loading_cupertino.dart`. Import stateless widget dari material dan cupertino. Lalu isi kode di dalam method Widget build adalah sebagai berikut.

```dart
return MaterialApp(
      home: Container(
        margin: const EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CupertinoButton(
              child: const Text("Contoh button"),
              onPressed: () {},
            ),
            const CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
```

<p align = "center">
    <img src = "img\Prak_5_Langkah1.png" alt = "Output" width = "700"/>
</p>

**Langkah 2: Floating Action Button (FAB)**

Button widget terdapat beberapa macam pada flutter yaitu ButtonBar, DropdownButton, TextButton, FloatingActionButton, IconButton, OutlineButton, PopupMenuButton, dan ElevatedButton.

Buat file di basic_widgets > `fab_widget.dart`. Import stateless widget dari material. Lalu isi kode di dalam method Widget build adalah sebagai berikut.

```dart
return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.thumb_up),
          backgroundColor: Colors.pink,
        ),
      ),
    );
```

<p align = "center">
    <img src = "img\Prak_5_Langkah2.png" alt = "Output" width = "700"/>
</p>

**Langkah 3: Scaffold Widget**

Scaffold widget digunakan untuk mengatur tata letak sesuai dengan material design.

Ubah isi kode `main.dart` seperti berikut.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'My Increment App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
```
<p align = "center">
    <img src = "img\Prak_5_Langkah3.png" alt = "Output" width = "700"/>
</p>

**Langkah 4: Dialog Widget**

Dialog widget pada flutter memiliki dua jenis dialog yaitu `AlertDialog` dan `SimpleDialog`.

Ubah isi kode `main.dart` seperti berikut.

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyLayout(),
      ),
    );
  }
}

class MyLayout extends StatelessWidget {
  const MyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text('Show alert'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("My title"),
    content: const Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
```

<p align = "center">
    <img src = "img\Prak_5_Langkah4,1.png" alt = "Output" width = "700"/>
</p>

Ketika di klik show alert maka akan menampilkan popup alert

<p align = "center">
    <img src = "img\Prak_5_Langkah4,2.png" alt = "Output" width = "700"/>
</p>

**Langkah 5: Input dan Selection Widget**

Flutter menyediakan widget yang dapat menerima input dari pengguna aplikasi yaitu antara lain Checkbox, Date and Time Pickers, Radio Button, Slider, Switch, TextField.

Contoh penggunaan TextField widget adalah sebagai berikut:

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Contoh TextField")),
        body: const TextField(
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nama',
          ),
        ),
      ),
    );
  }
}
```

<p align = "center">
    <img src = "img\Prak_5_Langkah5,1.png" alt = "Output" width = "700"/>
</p>

<p align = "center">
    <img src = "img\Prak_5_Langkah5,2.png" alt = "Output" width = "700"/>
</p>

**Langkah 6: Date and Time Pickers**

Date and Time Pickers termasuk pada kategori input dan selection widget, berikut adalah contoh penggunaan Date and Time Pickers.

```dart
import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contoh Date Picker',
      home: MyHomePage(title: 'Contoh Date Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variable/State untuk mengambil tanggal
  DateTime selectedDate = DateTime.now();

  //  Initial SelectDate FLutter
  Future<void> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => {
                _selectDate(context),
                // ignore: avoid_print
                print(selectedDate.day + selectedDate.month + selectedDate.year)
              },
              child: const Text('Pilih Tanggal'),
            ),
          ],
        ),
      ),
    );
  }
}
```

<p align = "center">
    <img src = "img\Prak_5_Langkah6,1.png" alt = "Output" width = "700"/>
</p>

Ketika di klik pilih tanggal maka akan menampilkan kalender untuk memilih tanggal yang akan ditampilkan 

<p align = "center">
    <img src = "img\Prak_5_langkah6,2.png" alt = "Output" width = "700"/>
</p>

<p align = "center">
    <img src = "img\Prak_5_Langkah6,3.png" alt = "Output" width = "700"/>
</p>