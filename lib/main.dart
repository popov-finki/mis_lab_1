import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211160',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
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

  final List<Map<String, String>> products = const [
    {
      'name': 'T-Shirt',
      'image': 'assets/images/t-shirt.jpg',
      'description': 'A cotton t-shirt.',
      'price': '499 MKD',
    },
    {
      'name': 'Jeans',
      'image': 'assets/images/jeans.jpg',
      'description': 'Green jeans.',
      'price': '1899 MKD',
    },
    {
      'name': 'Jacket',
      'image': 'assets/images/jacket.jpg',
      'description': 'Cool jacket.',
      'price': '5999 MKD',
    },
    {
      'name': 'Sneakers',
      'image': 'assets/images/sneakers.jpg',
      'description': 'Comfortable sneakers.',
      'price': '2799 MKD',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('211160'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(product['image']!, width: 50, height: 50),
              title: Text(product['name']!),
              subtitle: Text(product['price']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product['image']!, width: 450, height: 450),
            const SizedBox(height: 20),
            Text(
              product['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(product['description']!),
            const SizedBox(height: 10),
            Text(
              'Price: ${product['price']}',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}