import 'package:app/common/utility/show_purchased_snackbar.dart';
import 'package:app/common/widget/cart_item_tile.dart';
import 'package:app/common/widget/cart_total_amount.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/p5/p5_my_cart_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class P5MyCartPage extends ConsumerWidget {
  const P5MyCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myCart = ref.watch(p5MyCartStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.of(context).canPop()
            ? BackButton(
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: const Text('Cart (P5)'),
      ),
      body: Column(
        children: [
          Expanded(
            child: myCart.items.isNotEmpty
                ? ListView.builder(
                    itemCount: myCart.items.length,
                    itemBuilder: (context, index) {
                      final item = myCart.items[index];
                      return CartItemTile(
                        item: item,
                        onTapRemove: () => ref
                            .read(p5MyCartStateNotifierProvider.notifier)
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
              ref.read(p5MyCartStateNotifierProvider.notifier).clear();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
