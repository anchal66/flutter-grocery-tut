import 'package:bloc_tet/features/cart/ui/cart.dart';
import 'package:bloc_tet/features/home/bloc/home_bloc.dart';
import 'package:bloc_tet/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
      },
      listenWhen: (pre, curr) => curr is HomeActionState,
      buildWhen: (pre, curr) => curr is! HomeActionState,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeWishListButtonNavigateEvent());
                },
                icon: Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeCartButtonNavigateEvent());
                },
                icon: Icon(Icons.shopping_bag_outlined),
              ),
            ],
            title: Text("Grocery APP"),
          ),
        );
      },
    );
  }
}
