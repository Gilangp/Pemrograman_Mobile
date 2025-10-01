import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout: Gilang Purnomo dan 2341720042',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Strawberry Pavlova',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. '
                        'Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // Rating Row
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Row(
                    //       children: List.generate(
                    //         5,
                    //         (index) => const Icon(Icons.star, color: Colors.red),
                    //       ),
                    //     ),
                    //     const SizedBox(width: 8),
                    //     const Text("170 Reviews"),
                    //   ],
                    // ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => const Icon(Icons.star, color: Colors.red),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("170 Reviews"),
                        ],
                      ),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Column(
                          children: [
                            Icon(Icons.kitchen, color: Colors.green),
                            Text("PREP:"),
                            Text("25 min"),
                          ],
                        ),

                        Column(
                          children: [
                            Icon(Icons.timer, color: Colors.green),
                            Text("COOK:"),
                            Text("1 hr"),
                          ],
                        ),

                        Column(
                          children: [
                            Icon(Icons.restaurant, color: Colors.green),
                            Text("FEEDS:"),
                            Text("4-6"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Image.asset(
                  'images/cake.jpg',
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
