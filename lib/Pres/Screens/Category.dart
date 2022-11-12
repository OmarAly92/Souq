import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Data/Category_Model.dart';
import '../../Bloc/Category Screen Cubit/category_screen_cubit.dart';
import '../../Utilities/Api.dart';
import '../../Utilities/Images.dart';
import '../../Utilities/Images_Widget.dart';
import '../../Utilities/routes.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryScreenCubit, CategoryScreenState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            BlocProvider.of<CategoryScreenCubit>(context).getCategory();
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategorySuccess) {
            return ListView.builder(
              itemCount:
                  BlocProvider.of<CategoryScreenCubit>(context).models!.length,
              itemBuilder: (context, index) {
                var model = BlocProvider.of<CategoryScreenCubit>(context)
                    .models![index];
                return Column(
                  children: [
                    const SizedBox(
                      height: 28,
                    ),
                    ListTile(
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                      ),
                      title: Text(model.name.toString()),
                      leading: Image.network(
                        "${Images().categoryImg.elementAt(index)["images"]}",
                        width: 45,
                        height: 45,
                      ),
                      // style: ListTileStyle.drawer,
                      onTap: () {
                        Navigator.pushNamed(context, home);
                      },
                    ),
                  ],
                );
              },
            );
          } else if (state is CategoryFailure) {
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
        },
      ),
    );
  }
}

class DioCategory {
  Future<List<Data>> getCategory() async {
    Response response = await Dio().get(categoryApi);
    CategoryModel object = CategoryModel.fromJson(response.data);
    return object.data!;
  }
}
