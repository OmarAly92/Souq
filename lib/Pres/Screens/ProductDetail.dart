// ignore_for_file: file_names
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:souq/Data/Details_Model.dart';
import '../../Bloc/Product Detail Screen Cubit/product_detail_cubit.dart';
import '../../Repos/ApiConnect.dart';
import '../../Utilities/Images.dart';
import 'ShoppingCart.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail(
      {Key? key, required this.title, required this.imageDetail})
      : super(key: key);
  final String title;
  final String imageDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffedecf2),
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            )),
        title: const Text(
          "Product",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<DetailsModel>(
          future: GetRequest().getDetailModel(title),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              var model = snapshot.data!.data!;
              return BlocBuilder<ProductDetailCubit, ProductDetailState>(
                builder: (context, state) {
                  return ListView(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, bottom: 3, left: 6),
                        child: Text(
                          "${model.createdBy!.name}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade900),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          "${model.title}",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.yellowAccent.shade700,
                              ),
                              onRatingUpdate: (double value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5, bottom: 5),
                            child: Text("(${Random().nextInt(100)})"),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade100)),
                        child: Stack(
                          children: [
                            Image.network(
                              imageDetail,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height / 1.8,
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey.shade600,
                                  size: 28,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 40,
                              right: 6,
                              child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.share_outlined,
                                  color: Colors.grey.shade600,
                                  size: 27,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5, top: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // RatingBar.builder(
                                //   initialRating: 4,
                                //   minRating: 1,
                                //   direction: Axis.horizontal,
                                //   itemCount: 5,
                                //   itemSize: 15,
                                //   itemPadding: const EdgeInsets.symmetric(
                                //       horizontal: 4),
                                //   itemBuilder: (context, index) => const Icon(
                                //     Icons.star,
                                //     color: Colors.yellow,
                                //   ),
                                //   onRatingUpdate: (double value) {},
                                // ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 72),
                                        child: Text(
                                          "\$${BlocProvider.of<ProductDetailCubit>(context).num == 0 ? model.price! : (model.price!) * BlocProvider.of<ProductDetailCubit>(context).num}.00",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade800),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "\$${(model.price! * 1.5).toStringAsFixed(2)}",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize: 23.5,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade800),
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Container(
                                            width: 70,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color:
                                                    Colors.redAccent.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Center(
                                              child: Text(
                                                "33% OFF",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red.shade900),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            CupertinoIcons.minus_circle_fill,
                                            size: 30,
                                            color: Colors.red.shade900,
                                          ),
                                          onPressed: () {
                                            BlocProvider.of<ProductDetailCubit>(
                                                    context)
                                                .increment("-");
                                          },
                                        )),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "${BlocProvider.of<ProductDetailCubit>(context).num}",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          CupertinoIcons.plus_circle_fill,
                                          size: 30,
                                          color: Colors.red.shade900,
                                        ),
                                        onPressed: () {
                                          BlocProvider.of<ProductDetailCubit>(
                                                  context)
                                              .increment("+");
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: [
                                    Text(
                                      "Free delivery ",
                                      style: TextStyle(
                                          color: Colors.red.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const Text(
                                      "by Sat, Oct 8",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Description:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  model.slug!.replaceAll("-", " "),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.5),
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.125,
                            ),
                          )
                        ],
                      ),
                      BottomAppBar(
                        child: Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          decoration: BoxDecoration(color: Colors.red.shade900,
                              // borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(
                              //   "\$${BlocProvider.of<ProductDetailCubit>(context).num == 0 ? model.price : model.price! * BlocProvider.of<ProductDetailCubit>(context).num}",
                              //   style: const TextStyle(
                              //       fontSize: 25,
                              //       fontWeight: FontWeight.bold,
                              //       color: Colors.black),
                              // ),
                              Container(
                                height: 55,
                                width: 60,
                                color: Colors.white,
                                // margin: const EdgeInsets.symmetric(
                                //     horizontal: 10),
                                child: Center(
                                  child: Text(
                                    "QTY\n   ${BlocProvider.of<ProductDetailCubit>(context).num}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 1.4),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                          create: (context) =>
                                              ProductDetailCubit(),
                                          child: ShoppingCart(
                                            title: '${model.title}',
                                            price: model.price,
                                            img: imageDetail,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red.shade900),
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            vertical: 18,
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3158),
                                      ),
                                      shape: MaterialStateProperty.all(
                                          const ContinuousRectangleBorder())),
                                  child: const Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return  Column(
                children: [
                  const SizedBox(
                    height: 225,
                  ),
                  Image.asset(
                    error,
                    fit: BoxFit.scaleDown,filterQuality: FilterQuality.high,
                  ),
                ],
              );
            }
          }),
    );
  }
}

//Color(0xff4c53a5)
