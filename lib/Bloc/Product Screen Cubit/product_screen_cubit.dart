import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';


import '../../Data/Product_Model.dart';
import '../../Repos/ApiConnect.dart';

part 'product_screen_state.dart';

class ProductScreenCubit extends Cubit<ProductScreenState> {
  ProductScreenCubit(this.getRequest) : super(ProductLoading());
  GetRequest getRequest;
  List<Data>? model = ProductModel().data;

  void getProduct() async {
    emit(ProductLoading());
    try {
      model = await getRequest.getProduct();
      emit(ProductSuccess());
    } catch (e) {
      emit(ProductFailure());
    }
  }
}
