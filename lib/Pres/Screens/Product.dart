// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/Product Detail Screen Cubit/product_detail_cubit.dart';
import '../../Bloc/Product Screen Cubit/product_screen_cubit.dart';
import '../../Data/Product_Model.dart';
import '../../Utilities/Images.dart';
import '../../Utilities/Images_Widget.dart';
import '../Widgets/Carousel Slider.dart';
import '../Widgets/Category_Widget.dart';
import 'ProductDetail.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffedecf2),
      body: BlocBuilder<ProductScreenCubit, ProductScreenState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            BlocProvider.of<ProductScreenCubit>(context).getProduct();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  SliderImage(
                    images: Images().imgList,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.symmetric(vertical: 18, horizontal: 9),
                    child: const Text(" Categories:",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  const CategoryWidget(),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 9),
                    child: const Text(" Best selling:",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 368,
                      //  MediaQuery.of(context).size.height * 0.5,
                    ),
                    shrinkWrap: true,
                    itemCount: BlocProvider.of<ProductScreenCubit>(context)
                        .model!
                        .length,
                    itemBuilder: (context, index) {
                      Data model = BlocProvider.of<ProductScreenCubit>(context)
                          .model![index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 15,
                          right: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            // ProductDetail(title: model.title.toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BlocProvider<ProductDetailCubit>(
                                    create: (context) => ProductDetailCubit(),
                                    child: ProductDetail(
                                      imageDetail:
                                          "${Images().productImg.elementAt(index)['images']}",
                                      title: '${model.title}',
                                    ),
                                  ),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(5),
                                    // color: Colors.lightBlue.shade100,
                                    // gradient: LinearGradient(
                                    //     colors: [
                                    //       Colors.amber.shade100,
                                    //       Colors.amber.shade100
                                    //     ],
                                    //     begin: Alignment.bottomRight,
                                    //     end: Alignment.bottomLeft)
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(16.0),
                                              topRight: Radius.circular(16.0),
                                            ),
                                            child: Image.network(
                                              "${Images().productImg.elementAt(index)['images']}",
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: 225,
                                            ),
                                          ),
                                          const Positioned(
                                            top: 3,
                                            right: 5,
                                            child: Icon(Icons.favorite_border),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 10),
                                        child: Text(
                                          "${Images().productImg.elementAt(index)["title"]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 14,
                                              top: 5,
                                            ),
                                            child: Text(
                                              "\$${model.price!.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 14,
                                              top: 5,
                                            ),
                                            child: Text(
                                              "\$${(model.price! * 1.5).toStringAsFixed(2)}",
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.grey.shade700),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                splashRadius: 0.1,
                                                highlightColor:
                                                    Colors.transparent,
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.share_outlined,
                                                    size: 18),
                                              ),
                                              IconButton(
                                                splashRadius: 0.1,
                                                highlightColor:
                                                    Colors.transparent,
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.shopping_bag_outlined,
                                                    size: 18),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is ProductFailure) {
            return   Column(
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
          } else {
            return  Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Image.asset(
                  error,
                  fit: BoxFit.cover,filterQuality: FilterQuality.high,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
