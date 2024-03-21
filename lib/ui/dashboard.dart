import 'package:flutter/material.dart';
import 'package:ecommerce_widget_lecture/ui/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          backgroundColor: Colors.white, // Set background color to white
          // You can customize more colors here if needed
        ),
        // useMaterial3: true, // No longer needed as Material3 is the default
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRAVEL PLANNER'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                // Implement your search functionality here
                print('Search query: $value');
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildImageCard(
                    imageUrl: 'https://picsum.photos/id/13/2500/1667',
                    textOverlay: 'Just Travel', // Add text overlay
                  ),
                  const SizedBox(height: 16),
                  _buildProductList(),
                  const SizedBox(height: 16),
                  _buildImageCard(
                    imageUrl: 'https://picsum.photos/id/172/2000/1325',
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard({required String imageUrl, String? textOverlay}) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Add snow white background
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (textOverlay != null) // Add text overlay if provided
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                textOverlay,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico', // Use Pacifico font
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          ProductImage(
            rndSeed: 1,
            nama: "Pulau Bermuda",
            harga: 25000000,
          ),
          const SizedBox(width: 16),
          ProductImage(
            rndSeed: 14,
            nama: "Gunung Bromo",
            harga: 2000000,
          ),
          const SizedBox(width: 16),
          ProductImage(
            rndSeed: 33,
            nama: "Pantai Biru",
            harga: 8000000,
          ),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final int rndSeed;
  final String nama;
  final double harga;

  const ProductImage({
    Key? key,
    required this.rndSeed,
    required this.nama,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement your onTap functionality here
        print('Product $nama clicked');
      },
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.network(
                'https://picsum.photos/200/?random=$rndSeed',
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rp. ${harga.toString()}',
                    style: TextStyle(
                      color: Colors.green,
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
  }
}
