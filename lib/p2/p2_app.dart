import 'package:app/p2/p2_catalog_page.dart';
import 'package:app/p2/p2_my_cart_model.dart';
import 'package:app/p2/p2_my_cart_page.dart';
import 'package:flutter/material.dart';

class P2App extends StatelessWidget {
  P2App({super.key});

  final myCart = P2MyCartModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => P2CatalogPage(myCart: myCart),
          '/my_cart': (context) => P2MyCartPage(myCart: myCart),
        });
  }
}
