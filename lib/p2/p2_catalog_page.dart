import 'package:flutter/material.dart';
import 'package:app/common/cart_button.dart';
import 'package:app/common/catalog_item_tile.dart';
import 'package:app/common/empty_state.dart';
import 'package:app/common/error_state.dart';
import 'package:app/common/item.dart';
import 'package:app/common/fetch_catalog_items.dart';
import 'package:app/common/loading_state.dart';
import 'package:app/p2/p2_my_cart_model.dart';

class P2CatalogPage extends StatefulWidget {
  const P2CatalogPage({
    super.key,
    required this.cart,
  });

  final P2MyCartModel cart;

  @override
  State<P2CatalogPage> createState() => _P2CatalogPageState();
}

class _P2CatalogPageState extends State<P2CatalogPage> {
  Future<List<Item>> catalogItems = fetchCatalogItems();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog@P2"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ListenableBuilder(
              listenable: widget.cart,
              builder: (context, _) => CartButton(
                badgeCount: widget.cart.items.length,
                onPressed: () => Navigator.of(context).pushNamed('/cart'),
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
                    ? ListenableBuilder(
                        listenable: widget.cart,
                        builder: (context, _) => ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return CatalogItemTile(
                              item: item,
                              isAdded: widget.cart.contains(item),
                              onTapAdd: () => widget.cart.add(item),
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
