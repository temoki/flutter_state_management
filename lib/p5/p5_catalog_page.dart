import 'package:app/common/data/fetch_catalog_items.dart';
import 'package:app/common/data/item.dart';
import 'package:app/common/widget/cart_button.dart';
import 'package:app/common/widget/catalog_item_tile.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/common/widget/error_state.dart';
import 'package:app/common/widget/loading_state.dart';
import 'package:app/p5/p5_my_cart_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class P5CatalogPage extends StatelessWidget {
  const P5CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog (P5)'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _P5CartButton(),
          ),
        ],
      ),
      body: _P5CatalogItemList(),
    );
  }
}

class _P5CartButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CartButton(
      badgeCount: ref.watch(
        p5MyCartStateNotifierProvider.select((state) => state.items.length),
      ),
      onPressed: () => Navigator.of(context).pushNamed('/my_cart'),
    );
  }
}

final _p5CatalogItemsProvider =
    FutureProvider<List<Item>>((ref) => fetchCatalogItems());

class _P5CatalogItemList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myCart = ref.watch(p5MyCartStateNotifierProvider);
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(_p5CatalogItemsProvider);
      },
      child: ref.watch(_p5CatalogItemsProvider).when(
            data: (catalogItems) => catalogItems.isNotEmpty
                ? ListView.builder(
                    itemCount: catalogItems.length,
                    itemBuilder: (context, index) {
                      final catalogItem = catalogItems[index];
                      return CatalogItemTile(
                        item: catalogItem,
                        isAdded: myCart.items.contains(catalogItem),
                        onTapAdd: () => ref
                            .read(p5MyCartStateNotifierProvider.notifier)
                            .add(catalogItem),
                      );
                    },
                  )
                : const EmptyState(),
            error: (error, stackTrace) => ErrorState(error: error),
            loading: () => const LoadingState(),
          ),
    );
  }
}
