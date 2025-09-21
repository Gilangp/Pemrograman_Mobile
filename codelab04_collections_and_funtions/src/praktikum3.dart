void main() {
  // var gifts = {
  //   // Key:    Value
  //   'first': 'partridge',
  //   'second': 'turtledoves',
  //   'fifth': 1
  // };

  // var nobleGases = {
  //   2: 'helium',
  //   10: 'neon',
  //   18: 2,
  // };

  // // Langkah 3
  // var mhs1 = Map<String, String>();
  // gifts['first'] = 'partridge';
  // gifts['second'] = 'turtledoves';
  // gifts['fifth'] = 'golden rings';

  // var mhs2 = Map<int, String>();
  // nobleGases[2] = 'helium';
  // nobleGases[10] = 'neon';
  // nobleGases[18] = 'argon';

  // print(gifts);
  // print(nobleGases);

  // print(mhs1);
  // print(mhs2);

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
}