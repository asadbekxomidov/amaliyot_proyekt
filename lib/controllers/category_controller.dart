import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryController extends ChangeNotifier {
  final List<Kategory> _list = [
    Kategory(
      id: 'category1',
      title: "Living Room",
      imageLink: "https://shorturl.at/FrYBh",
    ),
    Kategory(
      id: 'category2',
      title: "Wall Decoration",
      imageLink:
          "https://cdn.shopify.com/s/files/1/1568/8443/files/best-8-diy-wall-decor-ideas.jpg",
    ),
    Kategory(
      id: 'category3',
      title: "Garden Decoration",
      imageLink:
          "https://img.pikbest.com/ai/illus_our/20230423/067864c79e80c07df3c04c6dd1614205.jpg",
    ),
  ];

  List<Kategory> get list {
    return [..._list];
  }
}
