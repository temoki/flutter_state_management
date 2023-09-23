import 'package:app/common/data/item.dart';
import 'package:app/p1/p1_catalog_page.dart';
import 'package:app/p1/p1_my_cart_page.dart';
import 'package:flutter/material.dart';

class P1App extends StatefulWidget {
  const P1App({super.key});

  @override
  State<P1App> createState() => _P1AppState();
}

class _P1AppState extends State<P1App> {
  final Set<Item> myCartItems = {};

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
        '/': (context) => P1CatalogPage(
              myCartItems: myCartItems.toList(),
              onAddItem: (item) => setState(
                () => myCartItems.add(item),
              ),
            ),
        '/my_cart': (context) => P1MyCartPage(
              myCartItems: myCartItems.toList(),
              onRemoveItem: (item) => setState(
                () => myCartItems.remove(item),
              ),
              onClearItems: () => setState(myCartItems.clear),
            ),
      },
    );
  }
}
