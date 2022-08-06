import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suryamart/bloc/wishlist/wishlist_bloc.dart';
import 'package:suryamart/common/theme.dart';
import 'package:suryamart/models/product_model.dart';
import 'package:suryamart/screens/cart_screen.dart';
import 'package:suryamart/screens/catalog_screen.dart';
import 'package:suryamart/screens/home_screen.dart';
import 'package:suryamart/screens/profile_screen.dart';
import 'package:suryamart/screens/wishlist_screen.dart';

import 'models/category_model.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (_)=> WishlistBloc()..add(StartWishlist()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SuryaMart',
        theme: theme(),
        home: const IndexScreen(),
        initialRoute: '/',
        routes: {
          '/wishlist': (context) => const WishlistScreen(),
          '/detail': (context) => DetailScreen(
                product: ModalRoute.of(context)?.settings.arguments as Product,
              ),
          '/catalog': (context) => CatalogScreen(
              category: ModalRoute.of(context)?.settings.arguments as Category),
        },
      ),
    );
  }
}

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _navbarOption = <Widget>[
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navbarOption[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.white), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white), label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        //backgroundColor: Colors.white,
        selectedItemColor: const Color(0xffFAB045),
      ),
    );
  }
}
