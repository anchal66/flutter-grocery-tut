import 'package:bloc_tet/features/cart/ui/cart.dart';
import 'package:bloc_tet/features/home/bloc/home_bloc.dart';
import 'package:bloc_tet/features/home/ui/project_tile_widget.dart';
import 'package:bloc_tet/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // App opens add initial events
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
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
                body: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return ProjectTileWidget(
                          homeBloc: homeBloc,
                          productDataModel: successState.products[index]);
                    }));
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            //it will not here
            return SizedBox();
        }
      },
    );
  }
}
