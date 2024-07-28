import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishListButtonCLickedEvent>(
        homeProductWishListButtonCLickedEvent);

    on<HomeProductCartButtonCLickedEvent>(homeProductCartButtonCLickedEvent);

    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
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

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("test4");
    emit(HomeNavigateToCartPageActionState());
  }
}
