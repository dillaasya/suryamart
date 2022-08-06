part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishlist extends WishlistEvent{}

class AddWishlist extends WishlistEvent{
  final Product products;

  const AddWishlist(this.products);

  @override
  List<Object> get props => [products];
}

class RemoveWishlist extends WishlistEvent{
  final Product products;

  const RemoveWishlist(this.products);

  @override
  List<Object> get props => [products];
}