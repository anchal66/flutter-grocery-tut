import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tet/data/grocery_data.dart';
import 'package:bloc_tet/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonCLickedEvent>(
        homeProductWishListButtonCLickedEvent);

    on<HomeProductCartButtonCLickedEvent>(homeProductCartButtonCLickedEvent);

    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    //Caling API mock
    await Future.delayed(Duration(seconds: 2));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishListButtonCLickedEvent(
      HomeProductWishListButtonCLickedEvent event, Emitter<HomeState> emit) {
    print("test");
  }

  FutureOr<void> homeProductCartButtonCLickedEvent(
      HomeProductCartButtonCLickedEvent event, Emitter<HomeState> emit) {
    print("test2");
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("test3");
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event,
      Emitter<HomeState> emit) {
    print("test4");
    emit(HomeNavigateToCartPageActionState());
  }
}
