part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeCategoryLoading extends HomeState {}

class HomeCategoryLoaded extends HomeState {

}

class HomeCategoryError extends HomeState {
  final String error;
  const HomeCategoryError({required this.error});
}

class ChangeSliderIndex extends HomeState {}



class GetAllProductLoading extends HomeState {}

class GetAllProductLoaded extends HomeState {
 
}

class GetAllProductError extends HomeState {
  final String error;
  const GetAllProductError({required this.error});
}

class ChangePageIndex extends HomeState {}


class GetProductInCategoryLoading extends HomeState {}

class GetProductInCategoryLoaded extends HomeState {
 
}

class GetProductInCategoryError extends HomeState {
  final String error;
  const GetProductInCategoryError({required this.error});
}



class AddToWishListLoading extends HomeState {}

class AddToWishListLoaded extends HomeState {
 
}

class AddToWishListError extends HomeState {
  final String error;
  const AddToWishListError({required this.error});
}


class DeleteWishListLoading extends HomeState {}


class DeleteWishListLoaded extends HomeState {
 
}

class DeleteWishListError extends HomeState {
  final String error;
  const DeleteWishListError({required this.error});
}


class GetUserWishListLoading extends HomeState {}


class GetUserWishListLoaded extends HomeState {
 
}


class GetUserWishListError extends HomeState {
  final String error;
  const GetUserWishListError({required this.error});
}