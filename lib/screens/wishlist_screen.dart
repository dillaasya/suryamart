import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suryamart/bloc/wishlist/wishlist_bloc.dart';
import 'package:suryamart/widgets/custom_appbar.dart';

import '../widgets/product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Wishlist'),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is WishlistLoaded) {
              return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.4),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                      child: ProductCard(
                    product: state.wishlist.products[index],
                    widthFactor: 1.1,
                    isWishlist: true,
                  ));
                });
            }else{
              return const Text('Something when wrong');
            }
          },
        ));
  }
}
