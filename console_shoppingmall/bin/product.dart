import 'dart:io';

class Product {
  final String name;
  final int price;

  Product(String name, int price)
      : this.name = name, // name 을 생성자 매개변수로 받은 name으로 초기화
        this.price = price;

  @override
  String toString() {
    return "${name}, ${price}원";
  }
}

class ShoppingMall {
  static List<Product> products = [
    Product('셔츠', 300), // 생성자
    Product('바지', 500),
    Product('양말', 80),
    Product('스웨터', 600),
    Product('코트', 1100),
  ];

  final Map<String, int> cart = {};

  // 1번 판매 제품을 출력하는 함수
  void showProducts() {
    for (var product in products) {
      print("${product.name} / ${product.price}원");
    }
  }

  // 2번 상품을 장바구니에 담는 함수
  void addToCart() {
    Product? selectedProduct;
    while (selectedProduct == null) {
      stdout.write("상품 이름을 입력해 주세요: ");
      String? itemName = stdin.readLineSync();

      bool productExist = products
          .any((product) => product.name == itemName); // 입력한 상품 이름과 일치하는 항목 확인

      if (productExist) {
        selectedProduct =
            products.firstWhere((product) => product.name == itemName);
        // print(selectedProduct);
      } else {
        print("입력값이 올바르지 않아요 !");
      }
    }
    int? itemQ;
    while (itemQ == null) {
      stdout.write("몇 개 드릴까요? 숫자만 입력해 주세요: ");
      String? input = stdin.readLineSync();
      if (input == null || input.isEmpty) {
        print("입력값이 올바르지 않아요 !");
      } else {
        try {
          itemQ = int.parse(input);
          if (itemQ <= 0) {
            print("0개보다 많은 개수의 상품만 담을 수 있어요 !");
            itemQ = null;
          }
        } catch (e) {
          print("입력값이 올바르지 않아요 !");
        }
      }
    }
    // cart {} 에 추가 - 이미 있는 제품인 경우, 새로 담는 경우 분기
    String productName = selectedProduct.name;
    if (cart.containsKey(productName)) {
      cart[productName] = cart[productName]! + itemQ;
    } else {
      cart[productName] = itemQ;
    }
    print("장바구니에 상품이 담겼어요 !");
    // print("${productName} ${itemQ}개 추가 완료.");
    // print(cart);
  }

  // 3번 장바구니 총 가격 산출하는 함수
  void showTotal() {
    int totalPrice = 0;
    if (cart.isEmpty) {
      print("장바구니에 담긴 상품이 없습니다.");
    } else {
      //print(products);
      //print(cart); // {셔츠: 2, 양말: 3}
      StringBuffer message = StringBuffer(" (*^_^*) 어머머머머머머머, 고객님은 ");
      cart.forEach((productName, quantity) {
        message.write(" ${productName} ${quantity}개");
      });
      message.write("담으셨어요.");
      print(message.toString());
      cart.forEach((productName, quantity) {
        Product product =
            products.firstWhere((product) => product.name == productName);
        totalPrice += product.price * quantity;
      });
      print("장바구니에 ${totalPrice}원 어치를 담으셨네요 !");
      stdout.write("장바구니를 초기화하시려면 숫자 6을 입력해 주세요: ");
      String? reset = stdin.readLineSync();

      if (reset != null && reset == '6') {
        resetCart();
        print("장바구니가 비워졌어요 !");
      }
    }
  }

  void resetCart() {
    cart.clear();
  }
}
