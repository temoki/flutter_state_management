import 'package:app/common/data/my_cart_change_notifier.dart';
import 'package:app/p4/p4_catalog_page.dart';
import 'package:app/p4/p4_my_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class P4App extends StatelessWidget {
  const P4App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCartChangeNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const P4CatalogPage(),
          '/my_cart': (context) => const P4MyCartPage(),
        },
      ),
    );
  }
}
