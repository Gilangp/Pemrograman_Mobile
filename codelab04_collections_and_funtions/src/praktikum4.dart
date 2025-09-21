void main() {
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  // print(list1);
  print(list);
  print(list2);
  print(list2.length);

  // Langkah 3
  print("\nLangkah 3");
  var list1 = [1, 2, null];
  print(list1);
  var list3 = [0, ...?list1];
  print(list3.length);

  // NIM
  var nim = [2, 3, 4, 1, 7, 2, 0, 0, 4, 2];

  var listNim = [...nim];
  print(listNim);

  // Langkah 4
  print("\nLangkah 4");
  var promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  // Langkah 5
  print("\nLangkah 5");
  var login = 'Staff';
  var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print(nav2);

  // Langkah 6
  print("\nLangkah 6");
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}