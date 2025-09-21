void main() {
  //Langkah 1
  print("Langkah 1");
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  // Langkah 4
  print("\nLangkah 4");
  // Record type annotation in a variable declaration:
  (String, int) mahasiswa = ('Gilang Purnomo', 2341720042);
  print(mahasiswa);

  // Langkah 5
  print("\nLangkah 5");
  var mahasiswa2 = ('first', a: 2, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'

  print("\n");
  var mahasiswa3 = ('Gilang Purnomo', a: 2341720042, b: true, 'last');

  print(mahasiswa3.$1);
  print(mahasiswa3.a);
  print(mahasiswa3.b);
  print(mahasiswa3.$2);
}

// Langkah 3
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}