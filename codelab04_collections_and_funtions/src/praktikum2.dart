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