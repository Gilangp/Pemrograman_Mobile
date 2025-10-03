import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:belanja/models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      photo: 'assets/images/gula.jpg',
      stock: 20,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      photo: 'assets/images/garam.jpg',
      stock: 50,
      rating: 4.0,
    ),
    Item(
      name: 'Rice',
      price: 10000,
      photo: 'assets/images/rice.jpg',
      stock: 15,
      rating: 4.8,
    ),
    Item(
      name: 'Flour',
      price: 8000,
      photo: 'assets/images/flour.jpg',
      stock: 30,
      rating: 4.3,
    ),
    Item(
      name: 'Cooking Oil',
      price: 15000,
      photo: 'assets/images/oil.jpg',
      stock: 25,
      rating: 4.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gilang Purnomo - 2341720042")),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              context.push('/item', extra: item);
            },
            child: Card(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                      tag: item.name,
                      child: Image.asset(
                        item.photo,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Rp ${item.price}',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green)),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange, size: 16),
                                SizedBox(width: 4),
                                Text(item.rating.toString()),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
