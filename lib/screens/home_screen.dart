// ignore_for_file: dead_code, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:uts_2022130009/screens/product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      {
        'name': 'Hat',
        'price': 'Rp 50.000',
        'image': 'https://picsum.photos/204'
      },
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 09,
        title: Text(
          'BShop',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Aksi ketika ikon keranjang ditekan
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            name: product['name']!,
                            price: product['price']!,
                            image: product['image']!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.network(
                              product['image']!,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  product['price']!,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
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