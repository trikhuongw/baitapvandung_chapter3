import 'dart:io';

void main() {
  try {
    // Nhập dữ liệu
    print('Nhập chỉ số tiêu thụ điện (6 giá trị):');
    List<int> consumption = List.generate(6, (index) => int.parse(stdin.readLineSync()!));

    print('Nhập bảng giá điện (9 giá trị):');
    List<int> prices = List.generate(9, (index) => int.parse(stdin.readLineSync()!));

    // Tính toán số lượng kWh tiêu thụ cho từng loại
    List<int> kWh = [
      consumption[1] - consumption[0],
      consumption[3] - consumption[2],
      consumption[5] - consumption[4]
    ];

    // Kiểm tra các giá trị kWh phải >= 0
    for (int i = 0; i < kWh.length; i++) {
      if (kWh[i] < 0) {
        throw Exception("Lượng điện tiêu thụ không hợp lệ (kWh không được âm).");
      }
    }

    // Hàm tính tiền điện cho một loại
    int calculateBill(int kWh, List<int> prices) {
      int bill = 0;
      if (kWh > 0) {
        bill += kWh <= 50 ? kWh * prices[0] : 50 * prices[0];
        kWh -= 50;
        if (kWh > 0) {
          bill += kWh <= 100 ? kWh * prices[1] : 100 * prices[1];
          kWh -= 100;
          if (kWh > 0) {
            bill += kWh * prices[2];
          }
        }
      }
      return bill;
    }

    // Tính tổng tiền điện
    int totalBill = calculateBill(kWh[0], [prices[0], prices[1], prices[2]]) +
        calculateBill(kWh[1], [prices[3], prices[4], prices[5]]) +
        calculateBill(kWh[2], [prices[6], prices[7], prices[8]]);

    print("Tổng số tiền phải trả: $totalBill");

  } catch (e) {
    print("Lỗi: ${e.toString()}");
  }
}
