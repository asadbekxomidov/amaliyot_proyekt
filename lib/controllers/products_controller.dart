import 'dart:math';

import 'package:amaliyot_proyekt/models/product.dart';
import 'package:flutter/material.dart';

class ProductsController with ChangeNotifier {
  final List<Product> _list = [
    Product(
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
        imageLink: "https://m.media-amazon.com/images/I/61Ckk6bdzwL.jpg"),
    Product(
        id: UniqueKey().toString(),
        categoryId: "category2",
        type: "Paint",
        name: "Painting Berry Plants",
        price: 83,
        color: Color.fromRGBO(Random().nextInt(222), Random().nextInt(222),
            Random().nextInt(222), 1),
        rating: 4.2,
        reviewsCount: 86,
        descriptionTitle: "Beautiful Plant Drawing",
        descriptionContent:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem",
        imageLink:
            "https://hebstreit.com/cdn/shop/products/a-painting-of-a-plant-with-red-berries-and-leaves-820710g1.jpg"),
    Product(
        id: UniqueKey().toString(),
        categoryId: "category3",
        type: "Plant",
        name: "Decorative Plant",
        price: 105,
        color: Color.fromRGBO(Random().nextInt(222), Random().nextInt(222),
            Random().nextInt(222), 1),
        rating: 4.0,
        reviewsCount: 154,
        descriptionTitle: "Green Plant in a Pot",
        descriptionContent:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem",
        imageLink:
            "https://www.green4ever.shop/media/nextgenimages//artificial-spathiphyllum-king-g4e_00494-1-c8cc20c5.webp"),
    Product(
        id: UniqueKey().toString(),
        categoryId: "category2",
        type: "Paint",
        name: "Painting Berry Plants",
        price: 83,
        color: Color.fromRGBO(Random().nextInt(222), Random().nextInt(222),
            Random().nextInt(222), 1),
        rating: 4.2,
        reviewsCount: 86,
        descriptionTitle: "Beautiful Plant Drawing",
        descriptionContent:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem",
        imageLink:
            "https://hebstreit.com/cdn/shop/products/a-painting-of-a-plant-with-red-berries-and-leaves-820710g1.jpg"),
    Product(
        id: UniqueKey().toString(),
        categoryId: "category2",
        type: "Paint",
        name: "Painting Berry Plants",
        price: 83,
        color: Color.fromRGBO(Random().nextInt(222), Random().nextInt(222),
            Random().nextInt(222), 1),
        rating: 4.2,
        reviewsCount: 86,
        descriptionTitle: "Beautiful Plant Drawing",
        descriptionContent:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem",
        imageLink:
            "https://hebstreit.com/cdn/shop/products/a-painting-of-a-plant-with-red-berries-and-leaves-820710g1.jpg"),
    Product(
        id: UniqueKey().toString(),
        categoryId: "category2",
        type: "Paint",
        name: "Painting Berry Plants",
        price: 83,
        color: Color.fromRGBO(Random().nextInt(222), Random().nextInt(222),
            Random().nextInt(222), 1),
        rating: 4.2,
        reviewsCount: 86,
        descriptionTitle: "Beautiful Plant Drawing",
        descriptionContent:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem",
        imageLink:
            "https://hebstreit.com/cdn/shop/products/a-painting-of-a-plant-with-red-berries-and-leaves-820710g1.jpg"),
    Product(
        id: UniqueKey().toString(),
        categoryId: "category2",
        type: "Paint",
        name: "Painting Berry Plants",
        price: 83,
        color: Color.fromRGBO(Random().nextInt(222), Random().nextInt(222),
            Random().nextInt(222), 1),
        rating: 4.2,
        reviewsCount: 86,
        descriptionTitle: "Beautiful Plant Drawing",
        descriptionContent:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem",
        imageLink:
            "https://hebstreit.com/cdn/shop/products/a-painting-of-a-plant-with-red-berries-and-leaves-820710g1.jpg"),
  ];

  List<Product> get list {
    return [..._list];
  }

  void addProduct(Product product) {
    _list.add(product);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final index = _list.indexWhere((prod) => prod.id == id);
    if (index >= 0) {
      _list[index] = newProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _list.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
