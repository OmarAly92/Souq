part of 'category_screen_cubit.dart';

@immutable
abstract class CategoryScreenState {}

// class CategoryScreenInitial extends CategoryScreenState {}
class CategoryLoading extends CategoryScreenState {}
class CategorySuccess extends CategoryScreenState {}
class CategoryFailure extends CategoryScreenState {}
