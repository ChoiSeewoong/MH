import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> productList = [
    Product("셔츠", 45000),
    Product("원피스", 30000),
    Product("반팔티", 35000),
    Product("반바지", 38000),
    Product("양말", 5000),
  ];

  int totalPrice = 0; //장바구니 총 가격

  void addToCart(String productName, int quantity) {
    Product? selectedProduct = productList.firstWhere(
      (p) => p.name == productName,
      orElse: () => Product("", 0),
    );

    if (selectedProduct.name == "") {
      print("입력값이 올바르지 않아요 !");
      return;
    }

    if (quantity <= 0) {
      print("0개보다 많은 개수의 상품만 담을 수 있어요 !");
      return;
    }

    totalPrice += selectedProduct.price * quantity;
    print("장바구니에 상품이 담겼어요!");
  }

  void showTotal() {
    if (totalPrice == 0) {
      print("장바구니에 담긴 상품이 없습니다.");
    } else {
      print("장바구니에 $totalPrice 원 어치를 담으셨네요!");
    }
  }
}

void main() {
  ShoppingMall mall = ShoppingMall();
  bool isRunning = true;

  while (isRunning) {
    print("/n ====================");
    print("[1] 상품 목록 보기");
    print("[2] 장바구니에 담기");
    print("[3] 장바구니에 담긴 상품의 총 가격 보기");
    print("[4] 프로그램 종료");
    print("/n ====================");

    stdout.write("원하는 번호를 입력하세요:)");
    String? input = stdin.readLineSync();

    if (input == "1") {
      print("[1] 상품 목록 보기");
      ShoppingMall mall = ShoppingMall();
      for (var product in mall.productList) {
        print("${product.name} - ${product.price}원");
      }
    } else if (input == "2") {
      try {
        stdout.write("상품 이름을 입력해 주세요!");
        String? productName = stdin.readLineSync();

        stdout.write(" 상품 개수를 입력해주세요!");
        String? quantityInput = stdin.readLineSync();

        if (productName == null || quantityInput == null) {
          print("입력값이 올바르지 않아요!");
          continue;
        }

        int quantity = int.parse(quantityInput);
        ShoppingMall mall = ShoppingMall();
        mall.addToCart(productName, quantity);
        mall.showTotal();
      } catch (e) {
        print("입력값이 올바르지 않아요!");
      }
    } else if (input == "3") {
      mall.showTotal();
    } else if (input == "4") {
      while (true) {
        stdout.write("\n 정말 종료하시겠습니까? (5를 입력하면 종료, 다른 값을 입력하면 취소):");
        String? confirmInput = stdin.readLineSync();
        if (confirmInput == "5") {
          break;
        } else {
          print("종료하지 않습니다.");
        }
      }
      print("\n 이용해 주셔서 감사합니다~ 안녕히 가세요 !");
      isRunning = false;
    } else {
      print("지원하지 않는 기능입니다 ! 다시 시도해주세요 ...");
    }
  }
}
