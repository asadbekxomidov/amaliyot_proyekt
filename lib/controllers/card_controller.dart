import 'dart:math';

import 'package:amaliyot_proyekt/models/card.dart';
import 'package:amaliyot_proyekt/models/product.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final Cart _cart = Cart(
    products: {
      "product": Product(
        id: UniqueKey().toString(),
        categoryId: "category1",
        type: "Lamp",
        name: "Table Desk Lamp Light",
        price: 140,
        color: Color.fromRGBO(Random().nextInt(222), Random().nextInt(222),
            Random().nextInt(222), 1),
        rating: 5.0,
        reviewsCount: 124,
        descriptionTitle: "Simple & Minimalist Light",
        descriptionContent:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem",
        imageLink: "https://m.media-amazon.com/images/I/61Ckk6bdzwL.jpg",
      ),
      "amount": 1,
    },
    totalPrice: 0,
  );

  Cart get cart {
    return _cart;
  }

  void addToCart(Product product) {
    if (_cart.products.containsKey(product.id)) {
      _cart.products[product.id]["amount"]++;
    } else {
      _cart.products[product.id] = {
        "product": product,
        "amount": 1,
      };
    }
    calculateTotal();
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_cart.products.containsKey(productId)) {
      if (_cart.products[productId]["amount"] == 1) {
        _cart.products.removeWhere((key, value) {
          return key == productId;
        });
      } else {
        _cart.products[productId]["amount"]--;
      }
      calculateTotal();
      notifyListeners();
    }
  }

  void calculateTotal() {
    double total = 0;
    _cart.products.forEach((key, value) {
      total += value['product'].price * value['amount'];
    });
    _cart.totalPrice = total;
  }

  bool isInCart(String productId) {
    return _cart.products.containsKey(productId);
  }

  int getProductAmount(String productId) {
    return _cart.products[productId]['amount'];
  }
}