import 'package:app/p5/p5_catalog_page.dart';
import 'package:app/p5/p5_my_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class P5App extends StatelessWidget {
  const P5App({super.key});

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
          '/': (context) => const P5CatalogPage(),
          '/my_cart': (context) => const P5MyCartPage(),
        },
      ),
    );
  }
}
