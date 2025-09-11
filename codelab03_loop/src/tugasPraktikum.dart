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