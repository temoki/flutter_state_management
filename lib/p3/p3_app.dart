import 'package:app/common/data/my_cart_model.dart';
import 'package:app/p3/p3_catalog_page.dart';
import 'package:app/p3/p3_inherited_my_cart.dart';
import 'package:app/p3/p3_my_cart_page.dart';
import 'package:flutter/material.dart';

class P3App extends StatelessWidget {
  P3App({super.key});

  final myCart = MyCartModel();

  @override
  Widget build(BuildContext context) {
    return P3InheritedMyCart(
      myCart: myCart,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const P3CatalogPage(),
          '/my_cart': (context) => const P3MyCartPage(),
        },
      ),
    );
  }
}
