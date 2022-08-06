import 'package:flutter/material.dart';
import 'package:suryamart/models/category_model.dart';
import 'package:suryamart/models/product_model.dart';
import 'package:suryamart/widgets/custom_appbar.dart';
import 'package:suryamart/widgets/product_card.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;

  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> CategoryProducts = Product.products
        .where((element) => element.category == category.name)
        .toList();
    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        body: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.15),
            itemCount: CategoryProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: ProductCard(
                product: CategoryProducts[index],
                widthFactor: 2.2,
              ));
            }));
  }
}
