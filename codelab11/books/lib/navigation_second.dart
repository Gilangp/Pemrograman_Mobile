import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen - Gilangp'),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Abu-abu'),
              onPressed: () {
                color = Colors.grey.shade500;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Biru'),
              onPressed: () {
                color = Colors.blue.shade500;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Hitam'),
              onPressed: () {
                color = Colors.black;
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}
