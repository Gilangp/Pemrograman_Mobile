void main() {
  String nama = "Gilang Purnomo";
  String nim = "2341720042";

  print("Bilangan dari 0 sampai 201 dengan pengecekan bilangan prima:");

  for (int i = 0; i <= 201; i++) {
    bool prima = true;

    if (i < 2) {
      prima = false; // jadi 0 dan 1 bukan bilangan prima
    } else {
      for (int j = 2; j * j <= i; j++) {
        if (i % j == 0) {
          prima = false;
          break;
        }
      }
    }

    if (prima) {
      print("$i - $nama, NIM: $nim");
    } else {
      print("$i");
    }
  }
}
