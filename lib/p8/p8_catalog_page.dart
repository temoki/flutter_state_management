import 'package:app/common/data/fetch_catalog_items.dart';
import 'package:app/common/data/item.dart';
import 'package:app/common/widget/cart_button.dart';
import 'package:app/common/widget/catalog_item_tile.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/common/widget/error_state.dart';
import 'package:app/common/widget/loading_state.dart';
import 'package:app/p8/p8_my_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class P8CatalogPage extends StatefulWidget {
  const P8CatalogPage({super.key});

  @override
  State<P8CatalogPage> createState() => _P8CatalogPageState();
}

class _P8CatalogPageState extends State<P8CatalogPage> {
  Future<List<Item>> catalogItems = fetchCatalogItems();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog (P8)'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ScopedModelDescendant<P8MyCartModel>(
              builder: (context, child, myCart) => CartButton(
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
                    ? ScopedModelDescendant<P8MyCartModel>(
                        builder: (context, child, myCart) => ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return CatalogItemTile(
                              item: item,
                              isAdded: myCart.items.contains(item),
                              onTapAdd: () =>
                                  ScopedModel.of<P8MyCartModel>(context)
                                      .add(item),
                            );
                          },
                        ),
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
