import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitial());
  int num = 1;

  void increment(String sign) {
    if (sign == "+") {
      num++;
      emit(Increment());
    } else if (sign == "-" && num != 1) {
      num--;
      emit(Decrement());
    }
  }
}
