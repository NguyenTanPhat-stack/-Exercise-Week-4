import 'package:flutter/material.dart';

class Exercise2GridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bài 2: Grid View")),
      body: SingleChildScrollView( // Để cuộn được cả màn hình
        child: Column(
          children: [
            _buildSectionTitle("Fixed Column Grid"), // [cite: 11]
            _buildGridCount(),
            Divider(thickness: 2),
            _buildSectionTitle("Responsive Grid"), // [cite: 17]
            _buildGridExtent(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  // Section 1: GridView.count [cite: 6]
  Widget _buildGridCount() {
    return Container(
      height: 300, // Chiều cao cố định demo
      padding: EdgeInsets.all(8),
      child: GridView.count(
        crossAxisCount: 3, // Columns: 3 [cite: 7]
        mainAxisSpacing: 8, // Row spacing: 8 [cite: 8]
        crossAxisSpacing: 8, // Column spacing: 8 [cite: 9]
        childAspectRatio: 1, // Aspect ratio: 1 [cite: 10]
        children: List.generate(6, (index) => _buildGridItem(index)),
      ),
    );
  }

  // Section 2: GridView.extent [cite: 12]
  Widget _buildGridExtent() {
    return Container(
      height: 300,
      padding: EdgeInsets.all(10),
      child: GridView.extent(
        maxCrossAxisExtent: 150, // Max extent: 150 [cite: 13]
        mainAxisSpacing: 10, // Row spacing: 10 [cite: 14]
        crossAxisSpacing: 10, // Column spacing: 10 [cite: 15]
        childAspectRatio: 0.8, // Aspect ratio: 0.8 [cite: 16]
        children: List.generate(6, (index) => _buildGridItem(index)),
      ),
    );
  }

  // Widget con cho từng Item [cite: 18]
  Widget _buildGridItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[200], // Colored container [cite: 19]
        borderRadius: BorderRadius.circular(15), // Rounded corners [cite: 19]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image, size: 40), // Icon centered [cite: 20]
          SizedBox(height: 5),
          Text("Item ${index + 1}"), // Label text below [cite: 21]
        ],
      ),
    );
  }
}