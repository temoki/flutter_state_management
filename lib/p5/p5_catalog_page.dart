import 'package:app/common/widget/cart_button.dart';
import 'package:app/common/widget/catalog_item_tile.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/common/widget/error_state.dart';
import 'package:app/common/widget/loading_state.dart';
import 'package:app/p5/p5_catalog_items_provider.dart';
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
            child: _CartButton(),
          ),
        ],
      ),
      body: _CatalogItemList(),
    );
  }
}

class _CartButton extends ConsumerWidget {
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

class _CatalogItemList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myCart = ref.watch(p5MyCartStateNotifierProvider);
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(p5CatalogItemsProvider);
      },
      child: ref.watch(p5CatalogItemsProvider).when(
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
