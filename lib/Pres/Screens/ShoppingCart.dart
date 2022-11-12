import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/Product Detail Screen Cubit/product_detail_cubit.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart(
      {Key? key, required this.title, required this.price, required this.img})
      : super(key: key);
  String title;
  num? price;
  late String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Card(
                  margin: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    width: 375,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          height: 140,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 140,
                                child: Image.network(
                                  img,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(title,style: const TextStyle(fontSize:15,fontWeight: FontWeight.bold),),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("\$${price!}",style: const TextStyle(fontSize: 15,color: Colors.black),),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              BlocProvider.of<
                                                          ProductDetailCubit>(
                                                      context)
                                                  .increment("-");
                                            },
                                          ),
                                        ),
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              CupertinoIcons.plus_circle_fill,
                                              size: 30,
                                              color: Colors.red.shade900,
                                            ),
                                            onPressed: () {
                                              BlocProvider.of<
                                                          ProductDetailCubit>(
                                                      context)
                                                  .increment("+");
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 55,
                    width: 60,
                    // color: Colors.white,
                    child:  Center(
                      child: Column(
                        children: [

                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "Total",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          // SizedBox(height: 5,),
                          Text("\$${price!*BlocProvider.of<ProductDetailCubit>(context).num}",style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.4),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red.shade900),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.3158),
                          ),
                          shape: MaterialStateProperty.all(
                              const ContinuousRectangleBorder())),
                      child: const Text(
                        "Check out",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
