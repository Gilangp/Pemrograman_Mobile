# Tugas Praktikum

**Gilang Purnomo** / **14** / **2341720042** / **TI-3F**

## 1. Silakan selesaikan Praktikum 1 sampai 5, lalu dokumentasikan berupa screenshot hasil pekerjaan Anda beserta penjelasannya!

### Praktikum 1: Eksperimen Tipe Data List

**Langkah 1:**

Ketik atau salin kode program berikut ke dalam `void main()`.

``` dart
var list = [1, 2, 3];
assert(list.length == 3);
assert(list[1] == 2);
print(list.length);
print(list[1]);

list[1] = 1;
assert(list[1] == 1);
print(list[1]);
```

**Langkah 2:**

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan!

**Jawab:**
<p align = "center">
    <img src = "img\output prak1_langkah1.png" alt = "Output" width = "150"/>
</p>

saat di Run, program menampilkan output seperti gambar karena list pada Dart bersifat mutable sehingga elemennya dapat diubah setelah dibuat dan semua `assert` bernilai benar sehingga tidak ada error.

**Langkah 3:**

Ubah kode pada langkah 1 menjadi variabel final yang mempunyai index = 5 dengan default value = `null`. Isilah nama dan NIM Anda pada elemen index ke-1 dan ke-2. Lalu print dan capture hasilnya.

Apa yang terjadi ? Jika terjadi error, silakan perbaiki.

**Jawab:**

**Kode Program:**
```dart
  final list = [null, "Gilang Purnomo", "2341720042", null, null ];
  assert(list.length == 5);
  assert(list[1] == "Gilang Purnomo");
  print(list.length);
  print(list[1]);
  print(list[2]);
  print(list);
```
**Output:**

<p align = "center">
    <img src = "img\output prak1_langkah3.png" alt = "Output" width = "400"/>
</p>

### Praktikum 2: Eksperimen Tipe Data Set

**Langkah 1:**

Ketik atau salin kode program berikut ke dalam fungsi `main()`.

```dart
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
print(halogens);
```

**Langkah 2:**

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

**Jawab:**

<p align = "center">
    <img src = "img\output prak2_langkah1.png" alt = "Output" width = "400"/>
</p>

tidak terjadi error, namun variable helogens adalah **Set** yang berisi elemen unik yaitu nama - nama helogen. Jadi ketika di Run maka isi set akan ditampilkan seperti gambar tersebut, tapi set tidak memiliki indeks dan urutan elemen tidak selalu sama.

**Langkah  3:**

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
var names1 = <String>{};
Set<String> names2 = {}; // This works, too.
var names3 = {}; // Creates a map, not a set.

print(names1);
print(names2);
print(names3);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan ketiga variabel tersebut. Tambahkan elemen nama dan NIM Anda pada kedua variabel Set tersebut dengan dua fungsi berbeda yaitu `.add()` dan `.addAll()`. Untuk variabel Map dihapus, nanti kita coba di praktikum selanjutnya.

Dokumentasikan code dan hasil di console, lalu buat laporannya.

**Jawab:**

<p align = "center">
    <img src = "img\output prak2_langkah3.1.png" alt = "Output" width = "400"/>
</p>

tidak terjadi error dan akan menampilkan output seperti digambar, namaun `names1` dan `names2` itu bertipe **Set**, sedangkan `names3` bertipe **Map**. Jadi keliatannya outputnya sama cuman tipe datanya yang beda.

**Kode Perbaikan:**
```dart
void main() {
  // Langkah 1
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  // Langkah 3
  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  // var names3 = {}; // Creates a map, not a set.

  names1.add("Gilang Purnomo");
  names1.add("2341720042");
  names1.add("names1");

  names2.addAll({"Gilang Purnomo", "2341720042", "names2"});

  print(names1);
  print(names2);
}
```

**Output:**
<p align = "center">
    <img src = "img\output prak2_langkah3.2.png" alt = "Output" width = "400"/>
</p>

### Praktikum 3: Eksperimen Tipe Data Maps

**Langkah 1:**

Ketik atau salin kode program berikut ke dalam fungsi `main()`.

```dart
var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 1
};

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 2,
};

print(gifts);
print(nobleGases);
```

**Langkah 2:**

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

**Jawab:**

<p align = "center">
    <img src = "img\output prak3_langkah1.png" alt = "Output" width = "400"/>
</p>

Ketika di Run tidak terdapat error, namun dari kode tersebut dapat disimpulkan dart Map itu menyimpan data key-value. Tipe data key dan value bisa berbeda-beda, jadi meskipun ada campuran `String` dan `int`  pada value namun program tetap valid. 

**Langkah 3:**

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

``` dart
var mhs1 = Map<String, String>();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var mhs2 = Map<int, String>();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki.

Tambahkan elemen nama dan NIM Anda pada tiap variabel di atas (`gifts`, `nobleGases`, `mhs1`, dan `mhs2`). Dokumentasikan hasilnya dan buat laporannya!

**Jawab:**

<p align = "center">
    <img src = "img\output prak3_langkah3.1.png" alt = "Output" width = "400"/>
</p>

Ketika di Run tidak terdapat error, namun kode yang bertipe Map tersebut udah di deklarasi tipe datanya, contoh pada `var mhs2 = Map<int, String>();` jadi kode tersebut key int dan value String yang isa dimasukkan jika selain itu akan terjadi error seperti ini

<p align = "center">
    <img src = "img\output error prak3_langkah3.1.png" alt = "Output" width = "800"/>
</p>

**Menambahkan nama dan NIM**

**Kode Program:**
```dart
var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
    
  };

  var nobleGases = {
    2: 'helium', 
    10: 'neon', 
    18: 2,
    };

  var mhs1 = Map<String, String>();
  gifts['name'] = 'Gilang Purnomo';
  gifts['nim'] = '2341720042';

  mhs1['name'] = 'Gilang Purnomo';
  mhs1['nim'] = '2341720042';

  var mhs2 = Map<int, String>();
  nobleGases[4] = 'Gilang Purnomo';
  nobleGases[5] = '2341720042';

  mhs2[4] = 'Gilang Purnomo';
  mhs2[5] = '2341720042';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
  ```

**Output:**

<p align = "center">
    <img src = "img\output prak3_langkah3.2.png" alt = "Output" width = "600"/>
</p>

### Praktikum 4: Eksperimen Tipe Data List: Spread dan Control-flow Operators

**Langkah 1:**

Ketik atau salin kode program berikut ke dalam fungsi `main()`.

```dart
var list = [1, 2, 3];
var list2 = [0, ...list];
print(list1);
print(list2);
print(list2.length);
```

**Langkah 2:**

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

**Jawab:**

<p align = "center">
    <img src = "img\output error prak4_langkah1.png" alt = "Output" width = "600"/>
</p>

error karena variabelnya hanya list dan list2. Jadi list1 tidak ada.

**Kode Program:**

```dart
void main() {
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  // print(list1); yang salah
  print(list);
  print(list2);
  print(list2.length);
}
```

**Output:**

<p align = "center">
    <img src = "img\output prak4_langkah1.png" alt = "Output" width = "300"/>
</p>

**Langkah 3:**

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
list1 = [1, 2, null];
print(list1);
var list3 = [0, ...?list1];
print(list3.length);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki.

Tambahkan variabel list berisi NIM Anda menggunakan Spread Operators. Dokumentasikan hasilnya dan buat laporannya!

**Jawab:**

terdapat error karena varible `list1` belum dideklarasi dan perbaikannya seperti ini `var list1 = [1, 2, null];`

<p align = "center">
    <img src = "img\output prak4_langkah3.png" alt = "Output" width = "600"/>
</p>

**Menambah NIM**

```dart
// NIM
  var nim = [2, 3, 4, 1, 7, 2, 0, 0, 4, 2];

  var listNim = [...nim];
  print(listNim);
```
**Output:**

<p align = "center">
    <img src = "img\output NIM prak4_langkah3.png" alt = "Output" width = "400"/>
</p>

**Langkah 4:**

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
print(nav);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Tunjukkan hasilnya jika variabel `promoActive` ketika `true` dan `false`.

**Jawab:**

<p align = "center">
    <img src = "img\output prak4_langkah4_true.png" alt = "Output" width = "400"/>
</p>

<p align = "center">
    <img src = "img\output prak4_langkah4_false.png" alt = "Output" width = "400"/>
</p>

Jadi jika elemen `Outlet` ditampilkan maka kondisi `if (promoActive)` harus `true` dan jika tidak ditampilkan maka `false`.

**Langkah 5:**

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
print(nav2);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Tunjukkan hasilnya jika variabel `login` mempunyai kondisi lain.

**Jawab:**

<p align = "center">
    <img src = "img\output prak4_langkah5.png" alt = "Output" width = "400"/>
</p>

Jadi, `if (login case 'Manager') 'Inventory'` artinya Inventory hanya ditambahkan ke dalam list kalau nilai login cocok dengan `Manager`. Selain itu akan seperti ini

<p align = "center">
    <img src = "img\output prak4_langkah5_staff.png" alt = "Output" width = "400"/>
</p>

**Langkah 6:**

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
assert(listOfStrings[1] == '#1');
print(listOfStrings);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Jelaskan manfaat Collection For dan dokumentasikan hasilnya.

**Jawab:**

<p align = "center">
    <img src = "img\output prak4_langkah6.png" alt = "Output" width = "300"/>
</p>

Tidak terjadi error. Elemen `#0` ditambahkan terlebih dahulu, lalu loop for pada listOfInt akan menghasilakn output seperti di gambar. Assertion bernilai benar karena elemen pada indeks ke-1 adalah `#1` dan manfaat Collection For untuk memudahkan pembuatan list baru dari list lain secara lebih ringkas, efisien, serta mudah dibaca.

### Praktikum 5: Eksperimen Tipe Data Records

**Langkah 1:**

Ketik atau salin kode program berikut ke dalam fungsi `main()`.

```dart
var record = ('first', a: 2, b: true, 'last');
print(record)
```

**Langkah 2:**

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

**Jawab:**

<p align = "center">
    <img src = "img\output prak5_langkah1.png" alt = "Output" width = "300"/>
</p>

tidak terdapat error, record akan menampung nilai dengan bentuk positional fields `(first, last)` dan named fields `(a: 2, b: true)`dan ketika di Run, Dart akan menampilkan positional fields terlebih dahulu, baru kemudian named fields.

**Langkah 3:**

Tambahkan kode program berikut di luar scope `void main()`, lalu coba eksekusi (Run) kode Anda.

```dart
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Gunakan fungsi `tukar()` di dalam `main()` sehingga tampak jelas proses pertukaran value field di dalam Records.

**jawab:**

tidak terjadi terdapat error dan tidak terjadi apa - apa, karena ungsi `tukar()` tidak dipanggil di dalam `main()`, maka proses pertukaran nilai tidak terjadi dan output hanya menampilkan isi record biasa.

**Langkah 4:**

Tambahkan kode program berikut di dalam scope `void main()`, lalu coba eksekusi (Run) kode Anda.

```dart
// Record type annotation in a variable declaration:
(String, int) mahasiswa;
print(mahasiswa);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Inisialisasi field nama dan NIM Anda pada variabel record `mahasiswa` di atas. Dokumentasikan hasilnya dan buat laporannya!

**Jawab:**

jadi jika variabel mahasiswa belum di inisialisasi maka akan error. Setelah di inisialisasi seperti ini `(String, int) mahasiswa = ('Gilang Purnomo', 2341720042);` program akan berjalan dan menampilkan output seperti ini

<p align = "center">
    <img src = "img\output prak5_langkah4.png" alt = "Output" width = "300"/>
</p>

kesimpulannya record dengan type annotation harus diinisialisasi sebelum digunakan ini akan memudahkan penyimpanan data yang memiliki lebih dari satu nilai dengan tipe berbeda dalam satu variabel.

**Langkah 5:**

Tambahkan kode program berikut di dalam scope void main(), lalu coba eksekusi (Run) kode Anda.

```dart
var mahasiswa2 = ('first', a: 2, b: true, 'last');

print(mahasiswa2.$1); // Prints 'first'
print(mahasiswa2.a); // Prints 2
print(mahasiswa2.b); // Prints true
print(mahasiswa2.$2); // Prints 'last'
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Gantilah salah satu isi record dengan nama dan NIM Anda, lalu dokumentasikan hasilnya dan buat laporannya!

**Jawab:**

<p align = "center">
    <img src = "img\output prak5_langkah5.png" alt = "Output" width = "200"/>
</p>

tidak error, karena record di Dart mendukung akses dengan posisi ($1, $2, ...) maupun nama field (a, b, ...).

**ganti dengan nama dan NIM**

```dart
var mahasiswa2 = ('Gilang Purnomo', a: 2341720042, b: true, 'last');

  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2);
```

**Output:**

<p align = "center">
    <img src = "img\output prak5_nama dan NIM.png" alt = "Output" width = "200"/>
</p>


## 2. Jelaskan yang dimaksud Functions dalam bahasa Dart!

Functions dalam Dart adalah suatu kode yang bisa dipanggil untuk menjalankan tugas tertentu, menerima input (parameter), dan mengembalikan output (nilai). Functions ini memudahkan pengorganisasian kode dan dapat digunakan berulang kali.

Contoh sintaks:
```dart
int tambah(int a, int b) {
    return a + b;
}
```

## 3. Jelaskan jenis-jenis parameter di Functions beserta contoh sintaksnya!

Di Dart, terdapat tiga jenis parameter pada functions:

1. **Positional Parameters**  
    Parameter yang urutannya harus sesuai saat pemanggilan fungsi.  
    ```dart
    void greet(String name, int age) {
      print('Hello $name, umur $age');
    }
    greet('Gilang', 21);
    ```

2. **Optional Positional Parameters**  
    Parameter yang boleh tidak diisi, biasanya ditandai dengan tanda kurung siku `[ ]`.  
    ```dart
    void greet(String name, [int? age]) {
      print('Hello $name, umur $age');
    }
    greet('Gilang');
    ```

3. **Named Parameters**  
    Parameter yang dipanggil berdasarkan nama, biasanya ditandai dengan tanda kurung kurawal `{ }`.  
    ```dart
    void greet({required String name, int? age}) {
      print('Hello $name, umur $age');
    }
    greet(name: 'Gilang', age: 21);
    ```

## 4. Jelaskan maksud Functions sebagai first-class objects beserta contoh sintaknya!

Di Dart, functions adalah first-class objects, artinya functions bisa disimpan dalam variabel, dikirim sebagai parameter, dan dikembalikan dari function lain seperti data biasa.

**Contoh:**
```dart
void sayHello() {
    print('Hello!');
}

void execute(Function f) {
    f();
}

void main() {
    var greet = sayHello; // simpan function dalam variabel
    execute(greet);       // kirim function sebagai parameter
}
```

## 5. Apa itu Anonymous Functions? Jelaskan dan berikan contohnya!

Anonymous Functions (fungsi tanpa nama) adalah fungsi yang tidak diberi nama dan biasanya digunakan secara langsung di tempat fungsi dibutuhkan, seperti sebagai parameter atau callback.

**Contoh:**
```dart
var numbers = [1, 2, 3];
numbers.forEach((num) {
    print(num);
});
```

## 6. Jelaskan perbedaan Lexical scope dan Lexical closures! Berikan contohnya!

**Lexical scope** adalah aturan penentuan variabel berdasarkan lokasi penulisan kode (scope-nya sudah tetap saat kode ditulis).  
**Lexical closure** adalah fungsi yang "mengikat" variabel dari scope di sekitarnya, sehingga bisa mengakses variabel luar meski scope asalnya sudah selesai.

**Contoh Lexical Scope:**
```dart
void main() {
    int x = 10;
    void printX() {
        print(x); // x diakses dari scope main
    }
    printX();
}
```

**Contoh Lexical Closure:**
```dart
Function makeAdder(int addBy) {
    return (int x) => x + addBy; // addBy di-capture oleh closure
}

void main() {
    var addTwo = makeAdder(2);
    print(addTwo(3)); // Output: 5
}
```

## 7. Jelaskan dengan contoh cara membuat return multiple value di Functions!

Di Dart, return multiple value bisa dilakukan dengan menggunakan `Record` atau mengembalikan sebuah `Map` atau `List`. Cara paling umum adalah dengan `Record`.

**Contoh menggunakan Record:**
```dart
(String, int) getData() {
    return ('Gilang', 21);
}

void main() {
    var (name, age) = getData();
    print('Nama: $name, Umur: $age');
}
```

