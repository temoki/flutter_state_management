import 'package:app/common/data/fetch_catalog_items.dart';
import 'package:app/common/data/my_cart_state.dart';
import 'package:app/p9/p9_catalog_page.dart';
import 'package:app/p9/p9_my_cart_page.dart';
import 'package:app/p9/p9_redux_reducer.dart';
import 'package:app/p9/p9_redux_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class P9App extends StatefulWidget {
  const P9App({super.key});

  @override
  State<StatefulWidget> createState() => _P9AppState();
}

class _P9AppState extends State<P9App> {
  // ⭐️ Create Store as a final variable inside a State object.
  final store = Store<P9ReduxState>(
    reducer,
    initialState: P9ReduxState(
      catalogItems: fetchCatalogItems(),
      myCart: const MyCartState(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // ⭐️ Wrap app widget with a StoreProvider and pass the Store.
    return StoreProvider<P9ReduxState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const P9CatalogPage(),
          '/my_cart': (context) => const P9MyCartPage(),
        },
      ),
    );
  }
}
