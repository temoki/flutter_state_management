import 'package:flutter/material.dart';
import 'package:app/common/cart_button.dart';
import 'package:app/common/catalog_item_tile.dart';
import 'package:app/common/empty_state.dart';
import 'package:app/common/error_state.dart';
import 'package:app/common/item.dart';
import 'package:app/common/fetch_catalog_items.dart';
import 'package:app/common/loading_state.dart';

class P1CatalogPage extends StatefulWidget {
  const P1CatalogPage({
    super.key,
    required this.myCartItems,
    required this.onAddItem,
  });

  final List<Item> myCartItems;
  final Function(Item) onAddItem;

  @override
  State<P1CatalogPage> createState() => _P1CatalogPageState();
}

class _P1CatalogPageState extends State<P1CatalogPage> {
  Future<List<Item>> catalogItems = fetchCatalogItems();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog (P1)"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CartButton(
              badgeCount: widget.myCartItems.length,
              onPressed: () => Navigator.of(context).pushNamed('/my_cart'),
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
                          return CatalogItemTile(
                            item: item,
                            isAdded: widget.myCartItems.contains(item),
                            onTapAdd: () => widget.onAddItem(item),
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
