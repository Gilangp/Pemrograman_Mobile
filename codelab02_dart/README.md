# Tugas Praktikum

**Gilang Purnomo** / **14** / **2341720042** / **TI-3F**

## Soal 1
Modifikasilah kode pada baris 3 di VS Code atau Editor Code favorit Anda berikut ini agar mendapatkan keluaran (output) sesuai yang diminta!
<p align = "center">
    <img src = "img\Soal 1.png" alt = "Gambar soal 1" width = "400"/>
</p>

Output yang diminta (Gantilah **Fulan** dengan nama Anda):
<p align = "center">
    <img src = "img\Soal 1.2.png" alt = "Gambar soal 1.2" width = "400"/>
</p>

**Jawab:**

Kode program:
<p align = "center">
    <img src = "img\kode program.png"/>
</p>

Output:
<p align = "center">
    <img src = "img\output.png"/>
</p>

## Soal 2
Mengapa sangat penting untuk memahami bahasa pemrograman Dart sebelum kita menggunakan framework Flutter ? Jelaskan!

**Jawab:** karena Flutter dibangun menggunakan bahasa pemrograman Dart, maka sangat penting memahami Dart terlebih dahulu agar lebih mudah dalam mempelajari sintaks, konsep OOP, dan pemrograman asinkron yang digunakan di Flutter, sehingga saat membuat projek nanti akan menjadi lebih mudah.

## Soal 3
Rangkumlah materi dari codelab ini menjadi poin-poin penting yang dapat Anda gunakan untuk membantu proses pengembangan aplikasi mobile menggunakan framework Flutter.

**Jawab:**
### Poin-Poin Penting
1. **Pengantar Dart**  
   - Bahasa inti Flutter, modern, tingkat tinggi, dan berorientasi objek.  
   - Menjadi dasar penting untuk pengembangan aplikasi Flutter.  

2. **Keunggulan Dart**  
   - Productive tooling (analisis kode, plugin IDE, ekosistem paket).  
   - Garbage collection untuk mengelola memori.  
   - Type annotations opsional dengan static typing & type safety.  
   - Portabilitas: bisa dikompilasi ke JavaScript dan native (ARM/x86).  

3. **Evolusi atau Sejarah Dart**  
   - Diluncurkan 2011, stabil 2013, Dart 2.0 pada 2018.  
   - Awalnya ditujukan untuk menggantikan JavaScript, kini fokus ke mobile.  
   - Dirancang fleksibel, kuat, modern, dan lintas platform.  

4. **Cara Kerja Dart**  
   - Mendukung eksekusi melalui Dart VM (JIT) dan kompilasi AOT.  
   - JIT: digunakan saat pengembangan, mendukung debugging & hot reload.  
   - AOT: digunakan saat produksi, performa lebih cepat.  
   - Hot reload memungkinkan feedback cepat dalam pengembangan Flutter.  

5. **Struktur Bahasa Dart**  
   - Sintaks mirip C/Java/JavaScript sehingga mudah dipelajari.  
   - Semua data adalah objek, tidak ada primitive types.  
   - Mendukung OOP: encapsulation, inheritance, polymorphism, abstraction.  

6. **Operator Penting di Dart**  
   - **Aritmatika**: `+`, `-`, `*`, `/`, `~/`, `%`, `-expr`.  
   - **Increment & Decrement**: `++var`, `var++`, `--var`, `var--`.  
   - **Equality & Relational**: `==`, `!=`, `<`, `>`, `<=`, `>=`.  
   - **Logical**: `!`, `&&`, `||`.

## Soal 4
Buatlah penjelasan dan contoh eksekusi kode tentang perbedaan Null Safety dan Late variabel !

**Jawab:**
### Null Safety
- Null Safety adalah fitur Dart untuk mencegah error akibat nilai `null`.  
- Variabel ini secara default tidak boleh bernilai null, kecuali ditandai dengan tanda `?`.  
- Membantu mengurangi error `null reference` saat program dijalankan.  

**Contoh Kode:**
```dart
void main() {
  String nama = "Gilang";   // Tidak boleh null
  String? hobi;             // Boleh null karena menggunakan tanda ?

  print(nama);              // Output: Gilang
  print(hobi);              // Output: null
}
```

**Contoh Error Null Safety:**
```dart
void main() {
  String nama;   // Error
  print(nama);
}
```

### Late Variable
- late digunakan untuk mendeklarasikan variabel yang belum diinisialisasi saat deklarasi, tetapi akan diisi nilainya sebelum digunakan.
- Cocok untuk `lazy initialization`, misalnya nilai baru diberikan saat dibutuhkan.
- Jika dipakai sebelum diinisialisasi → akan menyebabkan `error runtime`.

**Contoh Kode:**
```dart
void main() {
  late String kata;

  kata = "Halo, Dart!";     // Inisialisasi sebelum dipakai
  print(kata);              // Output: Halo, Dart!
}
```

**Contoh Error Late Variable:**
```dart
void main() {
  late String pesan;

  // Error saat dirun karena 'pesan' belum diinisialisasi
  print(pesan);
}
```