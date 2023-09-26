import 'package:app/common/data/item.dart';
import 'package:app/common/widget/cart_button.dart';
import 'package:app/common/widget/catalog_item_tile.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/common/widget/error_state.dart';
import 'package:app/common/widget/loading_state.dart';
import 'package:app/p9/p9_redux_actions.dart';
import 'package:app/p9/p9_redux_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class P9CatalogPage extends StatelessWidget {
  const P9CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog (P9)'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            // ⭐️ Connect the Store to widgets that are affected by some state updates.
            child: StoreConnector<P9ReduxState, int>(
              converter: (store) => store.state.myCart.items.length,
              builder: (context, itemsCount) => CartButton(
                badgeCount: itemsCount,
                onPressed: () => Navigator.of(context).pushNamed('/my_cart'),
              ),
            ),
          ),
        ],
      ),
      // ⭐️ Wrap widgets affected by state updates in StoreBuilder.
      body: StoreBuilder<P9ReduxState>(
        builder: (context, store) => RefreshIndicator(
          // ⭐️ Dispatch the action that updates the state to the Store.
          onRefresh: () async =>
              store.dispatch(const RefreshCatalogItemsAction()),
          child: FutureBuilder<List<Item>>(
            future: store.state.catalogItems,
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
                              isAdded: store.state.myCart.items.contains(item),
                              onTapAdd: () => store.dispatch(
                                AddItemToMyCartAction(item: item),
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
      ),
    );
  }
}
