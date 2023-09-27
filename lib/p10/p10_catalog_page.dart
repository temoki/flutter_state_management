import 'package:app/common/data/fetch_catalog_items.dart';
import 'package:app/common/data/item.dart';
import 'package:app/common/widget/cart_button.dart';
import 'package:app/common/widget/catalog_item_tile.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/common/widget/error_state.dart';
import 'package:app/common/widget/loading_state.dart';
import 'package:app/p10/p10_my_cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class P10CatalogPage extends StatefulWidget {
  const P10CatalogPage({super.key});

  @override
  State<P10CatalogPage> createState() => _P10CatalogPageState();
}

class _P10CatalogPageState extends State<P10CatalogPage> {
  Future<List<Item>> catalogItems = fetchCatalogItems();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myCart = Provider.of<P10MyCartStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog (P10)'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Observer(
              builder: (context) => CartButton(
                badgeCount: myCart.items.length,
                onPressed: () => Navigator.of(context).pushNamed('/my_cart'),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            catalogItems = fetchCatalogItems();
          });
        },
        child: FutureBuilder<List<Item>>(
          future: catalogItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                return items.isNotEmpty
                    ? ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return Observer(
                            builder: (context) => CatalogItemTile(
                              item: item,
                              isAdded: myCart.contains(item),
                              onTapAdd: () => myCart.add(item),
                            ),
                          );
                        },
                      )
                    : const EmptyState();
              } else if (snapshot.hasError) {
                return ErrorState(error: snapshot.error!);
              }
            }
            return const LoadingState();
          },
        ),
      ),
    );
  }
}
