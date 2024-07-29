part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonCLickedEvent extends HomeEvent {

}

class HomeProductCartButtonCLickedEvent extends HomeEvent {

}

class HomeWishListButtonNavigateEvent extends HomeEvent {

}

class HomeCartButtonNavigateEvent extends HomeEvent {

}