part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonCLickedEvent extends HomeEvent {
  //to get Product which product is clicked:
  final ProductDataModel clickedProduct;

  HomeProductWishListButtonCLickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonCLickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonCLickedEvent({required this.clickedProduct});
}

class HomeWishListButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
