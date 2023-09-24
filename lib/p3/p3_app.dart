import 'package:app/common/data/my_cart_change_notifier.dart';
import 'package:app/p3/p3_catalog_page.dart';
import 'package:app/p3/p3_my_cart_inherited_widget.dart';
import 'package:app/p3/p3_my_cart_page.dart';
import 'package:flutter/material.dart';

class P3App extends StatelessWidget {
  P3App({super.key});

  final myCart = MyCartChangeNotifier();

  @override
  Widget build(BuildContext context) {
    // ⭐️ Insert InheritedWidget with ChangeNotifier in Widget tree.
    return P3MyCartInheritedWidget(
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
