// ignore_for_file: must_be_immutable

import 'package:amaliyot_proyekt/models/product.dart';
import 'package:amaliyot_proyekt/product_info/competition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  Product product;
  ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Maxsulotlar(),
                    ),
                  );
                },
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                "5",
                                style: TextStyle(color: Colors.yellow),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Text(
                            product.name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            product.type,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${product.price.toInt().toString()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.teal,
                                    fontSize: 18),
                              ),
                              IconButton(
                                onPressed: () {
                                  product.isFavorite = !product.isFavorite;
                                },
                                icon: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: product.isFavorite
                                        ? Colors.green
                                        : Colors.teal[100],
                                  ),
                                  child: Icon(
                                    Icons.favorite_outlined,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: -40,
                  child: Image.network(
                    product.imageLink,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
