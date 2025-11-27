import 'package:flutter/material.dart';
import '../models/pizza.dart';
import '../controllers/pizza_controller.dart';
import 'widgets/pizza_card.dart';
import 'widgets/loading_widget.dart';
import 'widgets/error_widget.dart' as error_widgets;
import 'pizza_detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PizzaController _pizzaController;

  @override
  void initState() {
    super.initState();
    _pizzaController = PizzaController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        elevation: 8,
        shadowColor: const Color(0xFF1976D2).withOpacity(0.3),
      ),
      body: FutureBuilder<List<Pizza>>(
        future: _pizzaController.getPizzaList(),
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
          if (snapshot.hasError) {
            return error_widgets.ErrorStateWidget(
              errorMessage: snapshot.error.toString(),
            );
          }
          if (!snapshot.hasData) {
            return const LoadingWidget();
          }

          final pizzas = snapshot.data ?? [];

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey.shade50, Colors.blue.shade50],
              ),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: pizzas.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PizzaDetailScreen(
                          pizza: pizzas[index],
                          isNew: false,
                        ),
                      ),
                    );
                  },
                  child: PizzaCard(pizza: pizzas[index]),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1976D2),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PizzaDetailScreen(pizza: Pizza(), isNew: true),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
