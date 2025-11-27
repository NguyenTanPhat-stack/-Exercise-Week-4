import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import thư viện

class Exercise3SharedPref extends StatefulWidget {
  @override
  _Exercise3SharedPrefState createState() => _Exercise3SharedPrefState();
}

class _Exercise3SharedPrefState extends State<Exercise3SharedPref> {
  final TextEditingController _controller = TextEditingController(); // [cite: 28]
  String _displayedName = "";

  // Hàm lưu tên [cite: 25]
  Future<void> _saveName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _controller.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Đã lưu tên!")));
  }

  // Hàm hiển thị tên [cite: 26]
  Future<void> _showName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Xử lý khi không có data [cite: 31]
      _displayedName = prefs.getString('username') ?? "Chưa có dữ liệu!";
    });
  }

  // Bonus: Nút Clear 
  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    setState(() {
      _displayedName = "";
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bài 3: Shared Preferences")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField( // TextField nhập tên [cite: 28]
              controller: _controller,
              decoration: InputDecoration(labelText: "Nhập tên của bạn"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _saveName, child: Text("Save Name")), // [cite: 29]
                ElevatedButton(onPressed: _showName, child: Text("Show Name")), // [cite: 30]
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: _clearData,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text("Clear Data", style: TextStyle(color: Colors.white))), // 
            SizedBox(height: 30),
            Text(
              "Tên đã lưu: $_displayedName",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}