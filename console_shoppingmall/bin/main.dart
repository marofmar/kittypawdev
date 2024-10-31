import 'dart:io';
import 'product.dart';

Map<int, String> services = {
  1: "상품 목록 보기",
  2: "장바구니에 담기",
  3: "장바구니에 담긴 상품의 총 가격 보기",
  4: "프로그램 종료",
  6: "장바구니 초기화",
};

int show() {
  while (true) {
    StringBuffer buffer = StringBuffer();
    for (var entry in services.entries) {
      buffer.write(" [${entry.key}] ${entry.value} /");
    }
    String options = buffer.toString();
    print(options);

    stdout.write(">>> 원하시는 서비스 번호를 입력하세요: ");
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("잘못된 입력입니다. 숫자를 입력해 주세요.");
      continue;
    }
    int? choice = int.tryParse(input);
    if (choice == null) {
      print("숫자만 입력해 주세요.");
      continue;
    }
    if (services.containsKey(choice)) {
      return choice;
    } else {
      print("${services.keys.toString()} 중의 숫자를 입력해 주세요.");
    }
  }

  // int input = int.parse(stdin.readLineSync()!);
  // return input;
}

void main() {
  bool run = true;
  ShoppingMall mall = ShoppingMall();
  while (run) {
    int choice = show();
    if (services.containsKey(choice)) {
      print("고객님이 선택하신 옵션은 **${services[choice]}**");
    } else {
      print("지원하지 않는 기능입니다. 다시 시도해 주세요 ..");
      continue;
    }
    switch (choice) {
      case 1:
        mall.showProducts();
        break;
      case 2:
        mall.addToCart();
        break;
      case 3:
        mall.showTotal();
        break;
      case 4:
        stdout.write("정말 종료하시겠습니까? 종료하시려면 숫자 5를 입려해 주세요: ");
        int? shutdown = int.tryParse(stdin.readLineSync()!);
        if (shutdown == 5) {
          print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");
          run = false;
        } else {
          print("종료하지 않습니다.");
        }

      default:
        print("지원하지 않는 기능입니다! 다시 시도해 주세요 ..");
    } // switch
  }
}
