// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:uts_2022130009/screens/login_screen.dart';
import 'package:uts_2022130009/screens/product_screen.dart';
import 'package:uts_2022130009/screens/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> cartItems = [];

  final products = [
    {
      'name': 'Sneakers',
      'price': 'Rp 350.000',
      'image': 'https://picsum.photos/200'
    },
    {
      'name': 'T-Shirt',
      'price': 'Rp 120.000',
      'image': 'https://picsum.photos/201'
    },
    {
      'name': 'Smart Watch',
      'price': 'Rp 500.000',
      'image': 'https://picsum.photos/202'
    },
    {
      'name': 'Polo Shirt',
      'price': 'Rp 270.000',
      'image': 'https://picsum.photos/203'
    },
    {'name': 'Hat', 'price': 'Rp 50.000', 'image': 'https://picsum.photos/204'},
    {
      'name': 'Leather Shoes',
      'price': 'Rp 500.000',
      'image': 'https://picsum.photos/205'
    },
    {
      'name': 'Wrist Band',
      'price': 'Rp 15.000',
      'image': 'https://picsum.photos/206'
    },
    {
      'name': 'Sun Glasses',
      'price': 'Rp 100.000',
      'image': 'https://picsum.photos/207'
    },
  ];

  void _goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(cartItems: cartItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title:
            const Text('BShop', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: _goToCart,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Logout'),
                      content: Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen()
                              ),
                              (route) => false,
                            );
                          },
                          child: Text('Logout'),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () async {
                      final updatedCart = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            name: product['name']!,
                            price: product['price']!,
                            image: product['image']!,
                            cartItems: cartItems,
                          ),
                        ),
                      );
                      if (updatedCart != null) {
                        setState(() {
                          cartItems = updatedCart;
                        });
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: Image.network(
                              product['image']!,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product['name']!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                const SizedBox(height: 4),
                                Text(product['price']!,
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
