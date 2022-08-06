import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:suryamart/models/category_model.dart';
import 'package:suryamart/models/product_model.dart';
import 'package:suryamart/widgets/custom_appbar.dart';
import 'package:suryamart/widgets/hero_carousel_card.dart';
import '../widgets/product_carousel.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Surya Mart',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Category.categories
                  .map((e) => HeroCarouselCard(category: e))
                  .toList(),
            ),
            const SectionTitle(
              title: 'RECOMMENDED',
            ),
            ProductCarousel(products: Product.products.where((element) => element.isRecommended).toList(),),
            // ProductCard(
            //   product: Product.products[0],
            // ),
            const SectionTitle(
              title: 'MOST POPULAR',
            ),
            ProductCarousel(products: Product.products.where((element) => element.isPopular).toList(),),
          ],
        ),
      ),
    );
  }
}

