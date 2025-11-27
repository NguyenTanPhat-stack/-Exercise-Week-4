import 'package:flutter/foundation.dart'; // Để dùng compute
import 'package:flutter/material.dart';

// Hàm tính giai thừa (chạy ở background)
// Cần để outside class hoặc static
BigInt calculateFactorial(int n) {
  BigInt result = BigInt.from(1);
  for (int i = 1; i <= n; i++) {
    result *= BigInt.from(i);
  }
  return result;
}

class Exercise5Isolate extends StatefulWidget {
  @override
  _Exercise5IsolateState createState() => _Exercise5IsolateState();
}

class _Exercise5IsolateState extends State<Exercise5Isolate> {
  bool _isLoading = false;
  String _result = "";

  Future<void> _runHeavyTask() async {
    setState(() {
      _isLoading = true; // Shows loading [cite: 47]
      _result = "";
    });

    // Uses an isolate (compute) [cite: 46]
    // Tính giai thừa của 30000 [cite: 45]
    try {
      final result = await compute(calculateFactorial, 30000); 
      setState(() {
        // Chỉ lấy 100 ký tự đầu để hiển thị cho đỡ lag UI
        _result = "Kết quả (100 số đầu): ${result.toString().substring(0, 100)}..."; 
      });
    } catch (e) {
      _result = "Lỗi: $e";
    } finally {
      setState(() {
        _isLoading = false; // [cite: 48]
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bài 5: Isolate Factorial")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Tính 30,000! dùng Isolate"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _runHeavyTask,
              child: Text("Bắt đầu tính"),
            ),
            SizedBox(height: 20),
            _isLoading 
              ? CircularProgressIndicator() 
              : Expanded(child: SingleChildScrollView(child: Text(_result))),
          ],
        ),
      ),
    );
  }
}