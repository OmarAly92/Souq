part of 'product_detail_cubit.dart';

@immutable
abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class Increment extends ProductDetailState {}

class Decrement extends ProductDetailState {}
