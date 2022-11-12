part of 'product_screen_cubit.dart';

@immutable
abstract class ProductScreenState {}

// class ProductScreenInitial extends ProductScreenState {}
class ProductLoading extends ProductScreenState {}
class ProductSuccess extends ProductScreenState {}
class ProductFailure extends ProductScreenState {}
