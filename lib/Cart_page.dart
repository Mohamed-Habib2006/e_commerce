import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart",
          style:TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white),
            ),
          backgroundColor: Colors.purple,
        ),
        body: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: ListTile(
                  leading: Image.network(
                    item['image'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item['name']),
                  subtitle: Text("${item['price']}\$"),
                  trailing: Text(
                    "${index + 1}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            ),
        );
    }
}