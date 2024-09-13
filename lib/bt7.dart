import 'dart:io';

int countDivisibleBy3(int n) {
  Set<int> numbers = Set(); // Sử dụng Set để tránh trùng lặp

  // Đổi số nguyên thành chuỗi
  String numStr = n.toString();
  numbers.add(n); // Thêm số nguyên gốc vào tập hợp

  // Tạo các số mới bằng cách xóa từng chữ số
  for (int i = 0; i < numStr.length; i++) {
    for (int j = i + 1; j <= numStr.length; j++) {
      String substring = numStr.substring(0, i) + numStr.substring(j);
      // Chuyển chuỗi thành số và kiểm tra nếu nó không trống
      if (substring.isNotEmpty) {
        // Loại bỏ các số có chữ số bắt đầu bằng 0
        int num = int.parse(substring);
        if (substring.length == numStr.length - 1 || substring[0] != '0') {
          numbers.add(num);
        }
      }
    }
  }

  // Đếm số lượng số chia hết cho 3
  int count = 0;
  for (int num in numbers) {
    if (num % 3 == 0) {
      count++;
    }
  }

  return count;
}

void main() {
  print('Nhập số nguyên dương n: ');
  int n = int.parse(stdin.readLineSync()!);
  // int n = 1005;
  int result = countDivisibleBy3(n);
  print("Số lượng số chia hết cho 3: $result");
}
