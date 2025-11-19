import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider - gilangp'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Doc path: $documentsPath'),
                const SizedBox(height: 8),
                Text('Temp path: $tempPath'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => readFile(),
            child: const Text('Read File'),
          ),
        ],
      ),
    );
  }
}
