import 'package:app/p8/p8_catalog_page.dart';
import 'package:app/p8/p8_my_cart_model.dart';
import 'package:app/p8/p8_my_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class P8App extends StatelessWidget {
  const P8App({super.key});

  @override
  Widget build(BuildContext context) {
    // ⭐️ Insert ScopedModel with Model in Widget tree.
    return ScopedModel<P8MyCartModel>(
      model: P8MyCartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const P8CatalogPage(),
          '/my_cart': (context) => const P8MyCartPage(),
        },
      ),
    );
  }
}
