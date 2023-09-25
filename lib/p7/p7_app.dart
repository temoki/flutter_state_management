import 'package:app/p7/p7_catalog_page.dart';
import 'package:app/p7/p7_my_cart_cubit.dart';
import 'package:app/p7/p7_my_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class P7App extends StatelessWidget {
  const P7App({super.key});

  @override
  Widget build(BuildContext context) {
    // ⭐️ Insert BlocProvider with Cubit in Widget tree.
    return BlocProvider(
      create: (context) => P7MyCartCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const P7CatalogPage(),
          '/my_cart': (context) => const P7MyCartPage(),
        },
      ),
    );
  }
}
