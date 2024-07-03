// ignore_for_file: unused_import, unnecessary_import

import 'package:amaliyot_proyekt/controllers/card_controller.dart';
import 'package:amaliyot_proyekt/product_info/widgets/choice.dart';
import 'package:amaliyot_proyekt/screens/payment_screen.dart';
import 'package:amaliyot_proyekt/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Maxsulotlar extends StatefulWidget {
  const Maxsulotlar({super.key});

  @override
  State<Maxsulotlar> createState() => _MaxsulotlarState();
}

class _MaxsulotlarState extends State<Maxsulotlar> {
  int count = 0;
  bool isTap = false;
  bool isTap2 = false;
  bool isTap3 = true;
  int indexImage = 0;
  bool favoritButton = false;
  List images = [
    "https://lustrabra.ru/upload/iblock/e13/e13392de41afc2de37e80bdc903042db.jpeg",
    "https://dekov.ru/res/img/product/globo/22554/1.jpg",
    "https://lucisso.ru/upload/iblock/612/6127bae8c083f18acc4bd1099400e2f7.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Color.fromARGB(192, 64, 119, 66),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 140.w,
                    height: 220.h,
                    child: Image.network("${images[indexImage]}"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Lamp",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Table Desk",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Lamp Light",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Price",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "\$140.00",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.green.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Choose Colors",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          ZoomTapAnimation(
                            onTap: () {
                              isTap = true;
                              isTap2 = false;
                              isTap3 = false;
                              indexImage = 2;
                              setState(() {});
                            },
                            child: ChoiceContainer(
                              isTap: isTap,
                              colors: Colors.amber.shade700,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              isTap2 = true;
                              isTap = false;
                              isTap3 = false;
                              setState(() {});
                              indexImage = 1;
                            },
                            child: ChoiceContainer(
                              isTap: isTap2,
                              colors: Colors.cyanAccent.shade700,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              isTap3 = true;
                              isTap = false;
                              isTap2 = false;
                              indexImage = 0;
                              setState(() {});
                            },
                            child: ChoiceContainer(
                              isTap: isTap3,
                              colors: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                "Simple & Minimalist Light",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.",
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: favoritButton
                          ? Colors.green.shade300
                          : const Color.fromARGB(213, 200, 230, 201),
                    ),
                    child: IconButton(
                      onPressed: () {
                        favoritButton = !favoritButton;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.favorite,
                        color:
                            favoritButton ? Colors.red.shade400 : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ZoomTapAnimation(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 15,
                            ),
                            child: SingleChildScrollView(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "My Cart",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Card(
                                          elevation: 0,
                                          color: Color(0xff5f8b59),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 7.0, vertical: 6),
                                            child: Text(
                                              "2 items",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 360,
                                      child: ListView.builder(
                                        itemCount:
                                            cartController.cart.products.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 8.r),
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffEBEFEF),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    clipBehavior: Clip.hardEdge,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    height: 130.h,
                                                    width: 90.w,
                                                    child: Image.network(
                                                      "https://m.media-amazon.com/images/I/61Ckk6bdzwL.jpg",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 16.w,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Table Desk Lamp Light",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.sp,
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  if (count !=
                                                                      0) {
                                                                    count -= 1;
                                                                  }
                                                                });
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .remove_rounded,
                                                                color:
                                                                    Colors.grey,
                                                                size: 12.sp,
                                                              ),
                                                            ),
                                                            Text(
                                                              count.toString(),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14.sp,
                                                              ),
                                                            ),
                                                            IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  count += 1;
                                                                });
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .add_rounded,
                                                                color:
                                                                    Colors.grey,
                                                                size: 12.sp,
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 20.h,
                                                              width: 2.w,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Text(
                                                              "\$140.00",
                                                              style: TextStyle(
                                                                color: const Color(
                                                                    0xff5f8b59),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12.sp,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            TextButton.icon(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                  context,
                                                                );
                                                              },
                                                              icon: Icon(
                                                                  Icons
                                                                      .backspace_rounded,
                                                                  size: 16),
                                                              label: Text(
                                                                "Back",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                            TextButton.icon(
                                                              onPressed: () {
                                                                // Navigator.pushNamed(context, AppRoutes)
                                                              },
                                                              icon: Icon(
                                                                  Icons
                                                                      .domain_verification_sharp,
                                                                  size: 16),
                                                              label: Text(
                                                                "Add",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Total:",
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 5.h),
                                        Text(
                                          "\$ 280.00",
                                          style: TextStyle(
                                            color: Color(0xff5f8b59),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    ZoomTapAnimation(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (ctx) => PaymentScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'CHECKOUT CARD',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 220,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.green.shade300,
                      ),
                      child: const Center(
                        child: Text(
                          "ADD TO CART",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.green.shade300,
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
