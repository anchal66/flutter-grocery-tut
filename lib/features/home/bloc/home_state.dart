part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

//THis is for sending back to UI that item added success when fav or cart is clicked
//in ProductItem:
class HomeProductItemWishListedActionState extends HomeActionState {}
class HomeProductItemCartedActionState extends HomeActionState {}
//States are 2 type simple state that will build the UI,
//And actinable state