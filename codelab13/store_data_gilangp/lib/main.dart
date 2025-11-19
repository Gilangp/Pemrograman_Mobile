import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Path Provider - Gilangp',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String documentsPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';

  final pwdController = TextEditingController();
  String myPass = '';
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';

  @override
  void initState() {
    super.initState();
    getPaths()
        .then((_) async {
          if (documentsPath.isNotEmpty) {
            myFile = File('$documentsPath/pizzas.txt');
            await writeFile();
          }
        })
        .catchError((e) {
          print('Error in initState: $e');
          setState(() {
            documentsPath = 'Web platform - no file system';
            tempPath = 'Web platform - no file system';
          });
        });
  }

  Future<void> getPaths() async {
    try {
      final docDir = await getApplicationDocumentsDirectory();
      final tempDir = await getTemporaryDirectory();
      setState(() {
        documentsPath = docDir.path;
        tempPath = tempDir.path;
      });
    } catch (e) {
      print('Error getting paths: $e');
      setState(() {
        documentsPath = '/data/user/0/com.example.app/files';
        tempPath = '/data/user/0/com.example.app/cache';
      });
    }
  }

  Future<bool> writeFile() async {
    try {
      if (documentsPath.isEmpty || documentsPath.contains('mock')) {
        setState(() {
          fileText = 'Gilang Purnomo, 2341720042';
        });
        return true;
      }
      await myFile.writeAsString('Gilang Purnomo, 2341720042');
      return true;
    } catch (e) {
      print('Error writing file: $e');
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      if (documentsPath.isEmpty || documentsPath.contains('mock')) {
        setState(() {
          fileText = 'Gilang Purnomo, 2341720042';
        });
        return true;
      }
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      print('Error reading file: $e');
      return false;
    }
  }

  Future<void> writeToSecureStorage() async {
    try {
      await storage.write(key: myKey, value: pwdController.text);
      print('Data saved securely');
    } catch (e) {
      print('Error writing to secure storage: $e');
    }
  }

  Future<String> readFromSecureStorage() async {
    try {
      String? secret = await storage.read(key: myKey);
      return secret ?? '';
    } catch (e) {
      print('Error reading from secure storage: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Storage - gilangp'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Super Secret String!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: pwdController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your secret',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    writeToSecureStorage();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Value saved securely!')),
                    );
                  },
                  child: const Text('Save Value'),
                ),
                ElevatedButton(
                  onPressed: () {
                    readFromSecureStorage().then((value) {
                      setState(() {
                        myPass = value;
                      });
                    });
                  },
                  child: const Text('Read Value'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  myPass.isEmpty ? 'Data will appear here' : myPass,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
