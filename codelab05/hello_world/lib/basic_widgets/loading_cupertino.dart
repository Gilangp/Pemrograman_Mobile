import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingCupertino extends StatelessWidget {
  const LoadingCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Container(
          margin: const EdgeInsets.only(top: 30),
          color: Colors.white,
          child: Column(
              children: <Widget>[
                CupertinoButton(
                  child: const Text("Contoh button | Gilangp | 2341720042"),
                  onPressed: () {},
                ),
                const CupertinoActivityIndicator(),
              ],
          ),
        ),
    );
  }
}