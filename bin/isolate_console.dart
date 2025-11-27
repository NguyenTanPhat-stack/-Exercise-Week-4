import 'dart:async';
import 'dart:isolate';
import 'dart:math';

// Hàm cho worker isolate
void randomNumGenerator(SendPort sendPort) async {
  final random = Random();
  // Sends random numbers every second [cite: 52]
  Timer.periodic(Duration(seconds: 1), (timer) {
    int num = random.nextInt(20) + 1; // Random 1-20
    print('Worker gửi: $num');
    sendPort.send(num);
  });
  
  // Lắng nghe lệnh dừng từ main isolate (nếu cần thiết lập giao tiếp 2 chiều), 
  // nhưng ở bài này Main isolate chủ động đóng là được hoặc dùng exit.
}

void main() async {
  final receivePort = ReceivePort();
  
  // Spawns a background isolate [cite: 51]
  final isolate = await Isolate.spawn(randomNumGenerator, receivePort.sendPort);
  
  int sum = 0;
  
  // Main isolate continuously sums [cite: 53]
  await for (var msg in receivePort) {
    if (msg is int) {
      sum += msg;
      print('Main isolate: Tổng hiện tại = $sum');
      
      // When sum exceeds 100 [cite: 54]
      if (sum > 100) {
        print('Tổng > 100. Đang dừng...');
        receivePort.close();
        isolate.kill(priority: Isolate.immediate); // Stop worker
        // Hoặc Worker tự exit nếu thiết lập cổng nhận bên trong worker [cite: 55]
        print('Đã thoát chương trình.');
        break;
      }
    }
  }
}