import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

import '../../Data/Category_Model.dart';
import '../../Pres/Screens/Category.dart';

part 'category_screen_state.dart';

class CategoryScreenCubit extends Cubit<CategoryScreenState> {
  CategoryScreenCubit(this.categoriesObj) : super(CategoryLoading());
  DioCategory categoriesObj;
  List<Data>? models = CategoryModel().data;

  void getCategory() async {
    emit(CategoryLoading());
    try {
      models = await categoriesObj.getCategory();
      emit(CategorySuccess());
    } on Exception catch (e) {
      emit(CategoryFailure());
    }
  }
}
