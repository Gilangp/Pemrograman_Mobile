# Tugas Praktikum

**Gilang Purnomo** / **14** / **2341720042** / **TI-3F**

## 1. Silakan selesaikan Praktikum 1 sampai 3, lalu dokumentasikan berupa screenshot hasil pekerjaan beserta penjelasannya!

### Praktikum 1: Menerapkan Control Flows ("if/else")

**Langkah 1:**

Ketik atau salin kode program berikut ke dalam fungsi `main()`.

```dart
String test = "test2";
if (test == "test1") {
   print("Test1");
} else If (test == "test2") {
   print("Test2");
} Else {
   print("Something else");
}

if (test == "test2") print("Test2 again");
```

**Langkah 2:**

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan!

**Jawab:** 
<p align = "center">
    <img src = "img\SS output langkah 1.png" alt = "Gambar output langkah 1" width = "400"/>
</p>

jadi saat program dijalankan dengan nilai variabel `test = "test2"` outputnya **Test2** dan **Test2 again**, karena kondisi `else if (test == "test2")` bernilai benar sehingga mencetak "Test2", dan pada percabangan berikutnya `if (test == "test2")` juga benar sehingga mencetak "Test2 again".

**Langkah 2:**

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
String test = "true";
if (test) {
   print("Kebenaran");
}
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan if/else.

**Jawab:** kode diatas akan error karena kondisi `if` menggunakan variabel bertipe String, padahal Dart hanya menerima boolean. Jadi perbaikannya dengan mengganti menjadi variabel bertipe bool, seperti `bool test1 = true;`, sehingga kondisi dapat langsung diuji dan program berjalan

**Kode Perbaikan:**
```dart
bool test1 = true;
  if (test1) {
    print("Kebenaran");
  } else {
    print("Bukan Kebenaran");
  }
```
**Output:**

<p align = "center">
    <img src = "img\SS output langkah 3.png" alt = "Gambar output langkah 3" width = "400"/>
</p>

### Praktikum 2: Menerapkan Perulangan "while" dan "do-while"

**Langkah 1:**

Ketik atau salin kode program berikut ke dalam fungsi `main()`.

```dart
while (counter < 33) {
  print(counter);
  counter++;
}
```

**Langkah 2:**

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

**jawab:** ketika kode tersebut dijalankan akan terjadi error karena variabel `counter` belum dideklarasikan, lalu setelah diperbaiki dengan menambahkan inisialisasi `int counter = 0;`, kode dapat dieksekusi dengan benar dan akan melakukan perulangan sebanyak 33 kali karena nilai awal `counter = 0` dan kondisi `counter < 33`. Hasilnya, program mencetak angka dari 0 sampai 32.

**Kode Program:**

```dart
int counter = 0;
  while (counter < 33) {
    print(counter);
    counter++;
  }
```

**Output:**

![SS Output](/codelab03_loop/img/SS%20prak%202_langkah%201.png)

**Langkah 3:**

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
do {
  print(counter);
  counter++;
} while (counter < 77);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan do-while.

**jawab:** jadi setelah menambahkan kode `do-while`, program kembali mencetak nilai counter mulai dari 33 hingga 76 dan tidak terjadi error karena variabel `counter` sudah dideklarasikan sebelumnya. Jadi, gabungan perulangan `while` dan `do-while` menghasilkan deret angka dari 0 sampai 76.

**Output:**

![SS Output](/codelab03_loop/img/SS%20prak2_langkah%203.png)

### Praktikum 3: Menerapkan Perulangan "for" dan "break-continue"

**Langkah 1**

Ketik atau salin kode program berikut ke dalam fungsi `main()`.

```dart
for (Index = 10; index < 27; index) {
  print(Index);
}
```

**Langkah 2:**

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

**jawab:** Jadi ketika awal dijalankan akan terjadi error karena variabel index belum di deklarasikan dan jika sudah melakukan perbaikan, maka program akan berjalan dan mencetak angka 10 - 26

**Kode perbaikan:**

```dart
for (int index = 10; index < 27; index++) {
    print(index);
  }
  ```

**Output:**

![SS Output](/codelab03_loop/img/SS%20prak%203_langkah%201.png)


**Langkah 3**

Tambahkan kode program berikut di dalam for-loop, lalu coba eksekusi (Run) kode Anda.

```dart
if (Index == 21) break;
Else If (index > 1 || index < 7) continue;
print(index);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan for dan break-continue.

**Jawab:** Ketika program dijalankan, tidak akan ada otputnya, karena syarat `else if (index > 1 || index < 7)` selalu bernilai benar untuk setiap index mulai dari 10, sehingga perintah continue selalu dijalankan dan baris print(index) dilewati. Akibatnya tidak ada output yang muncul hingga perulangan dihentikan oleh kondisi `if (index == 21) break;`.

**Output:**

![](/codelab03_loop/img/SS%20prak%203_langkah%203.png)

## 2. Buatlah sebuah program yang dapat menampilkan bilangan prima dari angka 0 sampai 201 menggunakan Dart. Ketika bilangan prima ditemukan, maka tampilkan nama lengkap dan NIM Anda.

**Jawab:**

**Kode Program:**

```dart
void main() {
  String nama = "Gilang Purnomo";
  String nim = "2341720042";

  print("Bilangan prima dari 0 sampai 201:");
  for (int i = 0; i <= 201; i++) {
    bool prima = true;
    for (int j = 2; j * j <= i; j++) {
      if (i % j == 0) {
        prima = false;
        break;
      }
    }
    if (prima) {
      print("$i - $nama, NIM: $nim");
    }
  }
}
```

**Output:**
<p align = "center">
    <img src = "img\SS tugas praktikum.png " alt = "Gambar output langkah 3" width = "400"/>
</p>

## 3. Kumpulkan berupa link commit repo GitHub pada tautan yang telah disediakan di grup Telegram!