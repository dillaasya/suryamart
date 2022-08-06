// ignore_for_file: empty_catches

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suryamart/models/product_model.dart';
import 'package:suryamart/models/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());

  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    if (event is StartWishlist) {
      yield* _mapStartWishlistToState;
    } else if (event is AddWishlist) {
      yield* _mapAddWishlistToState(event, state);
    } else if (event is RemoveWishlist) {
      yield* _mapRemoveWishlistToState(event, state);
    }
  }

  Stream<WishlistState> get _mapStartWishlistToState async* {
    yield WishlistLoading();

    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const WishlistLoaded();
    } catch (e) {}
  }

  Stream<WishlistState> _mapAddWishlistToState(
      AddWishlist event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishlist: Wishlist(
                products: List.from(state.wishlist.products)
                  ..add(event.products)));
      } catch (e) {}
    }
  }

  Stream<WishlistState> _mapRemoveWishlistToState(
      RemoveWishlist event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishlist: Wishlist(
                products: List.from(state.wishlist.products)
                  ..remove(event.products)));
      } catch (e) {}
    }
  }
}
