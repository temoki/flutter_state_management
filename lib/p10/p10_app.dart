import 'package:app/p10/p10_catalog_page.dart';
import 'package:app/p10/p10_my_cart_page.dart';
import 'package:app/p10/p10_my_cart_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class P10App extends StatelessWidget {
  const P10App({super.key});

  @override
  Widget build(BuildContext context) {
    // ⭐️ Insert ChangeNotifierProvider with ChangeNotifier in Widget tree.
    return Provider(
      create: (context) => P10MyCartStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const P10CatalogPage(),
          '/my_cart': (context) => const P10MyCartPage(),
        },
      ),
    );
  }
}
