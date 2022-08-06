import 'package:flutter/material.dart';
import 'package:suryamart/models/product_model.dart';
import 'package:suryamart/widgets/custom_appbar.dart';

import '../widgets/cart_product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add \$20 for free delivery',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(),
                              elevation: 0),
                          child: Text(
                            'Add More Items',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CartProductCard(
                    products: Product.products[0],
                  ),
                  CartProductCard(
                    products: Product.products[0],
                  ),
                  CartProductCard(
                    products: Product.products[0],
                  ),
                  CartProductCard(
                    products: Product.products[0],
                  ),
                  CartProductCard(
                    products: Product.products[0],
                  ),
                  CartProductCard(
                    products: Product.products[0],
                  ),
                  CartProductCard(
                    products: Product.products[0],
                  ),
                  CartProductCard(
                    products: Product.products[0],
                  ),
                ],
              ),
              Column(
                children: [
                  const Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SUB TOTAL',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              '\$5.98',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'DELIVERY FEE',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              '\$2.98',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$10.98',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
