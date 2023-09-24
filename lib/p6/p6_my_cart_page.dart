import 'package:app/common/utility/show_purchased_snackbar.dart';
import 'package:app/common/widget/cart_item_tile.dart';
import 'package:app/common/widget/cart_total_amount.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/p6/p6_my_cart_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class P6MyCartPage extends ConsumerWidget {
  const P6MyCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart (P6)'),
      ),
      body: const _MyCartPageBody(),
    );
  }
}

class _MyCartPageBody extends ConsumerWidget {
  const _MyCartPageBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myCart = ref.watch(p6MyCartStateNotifierProvider);
    return Column(
      children: [
        Expanded(
          child: myCart.items.isNotEmpty
              ? ListView.builder(
                  itemCount: myCart.items.length,
                  itemBuilder: (context, index) {
                    final item = myCart.items.elementAt(index);
                    return CartItemTile(
                      item: item,
                      onTapRemove: () => ref
                          .read(p6MyCartStateNotifierProvider.notifier)
                          .remove(item),
                    );
                  },
                )
              : const EmptyState(),
        ),
        const Divider(),
        CartTotalAmount(
          totalAmount: myCart.totalAmount,
          onTapBuy: () {
            showPurchasedSnackbar(
              context,
              itemCount: myCart.items.length,
              totalAmount: myCart.totalAmount,
            );
            ref.read(p6MyCartStateNotifierProvider.notifier).clear();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
