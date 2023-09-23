import 'package:app/p6/p6_catalog_page.dart';
import 'package:app/p6/p6_my_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class P6App extends StatelessWidget {
  const P6App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const P6CatalogPage(),
          '/my_cart': (context) => const P6MyCartPage(),
        },
      ),
    );
  }
}
