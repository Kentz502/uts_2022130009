// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreen();
}

class _CartScreen extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {"name": "Produk A", "price": 50000, "quantity": 1},
    {"name": "Produk B", "price": 30000, "quantity": 2},
    {"name": "Produk C", "price": 150000, "quantity": 1},
  ];

  void _increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  num _calculateTotal() {
    num total = 0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blueAccent,
      ),
      body: cartItems.isEmpty
      ? Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
      : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo[100],
                        child: Icon(Icons.shopping_bag, color: Colors.indigo),
                      ),
                      title: Text(item['name']),
                      subtitle: Text(
                        'Rp ${item['price']} x ${item['quantity']} = Rp ${item['price'] * item['quantity']}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => _decreaseQuantity(index),
                            icon: Icon(Icons.remove_circle_outline),
                          ),
                          Text('${item['quantity']}'),
                          IconButton(
                            onPressed: () => _increaseQuantity(index),
                            icon: Icon(Icons.add_circle_outline),
                          ),
                          IconButton(
                            onPressed: () => _removeItem(index),
                            icon: Icon(Icons.delete_outline, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rp ${_calculateTotal()}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
