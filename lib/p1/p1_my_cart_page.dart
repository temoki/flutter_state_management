import 'package:app/common/data/item.dart';
import 'package:app/common/utility/show_purchased_snackbar.dart';
import 'package:app/common/widget/cart_item_tile.dart';
import 'package:app/common/widget/cart_total_amount.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:flutter/material.dart';

class P1MyCartPage extends StatelessWidget {
  const P1MyCartPage({
    super.key,
    required this.myCartItems,
    required this.onRemoveItem,
    required this.onClearItems,
  });

  final List<Item> myCartItems;
  final void Function(Item) onRemoveItem;
  final VoidCallback onClearItems;

  @override
  Widget build(BuildContext context) {
    final totalAmount =
        myCartItems.fold<int>(0, (sum, item) => sum + item.price);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart (P1)'),
      ),
      body: Column(
        children: [
          Expanded(
            child: myCartItems.isNotEmpty
                ? ListView.builder(
                    itemCount: myCartItems.length,
                    itemBuilder: (context, index) {
                      final item = myCartItems[index];
                      return CartItemTile(
                        item: item,
                        onTapRemove: () => onRemoveItem(item),
                      );
                    },
                  )
                : const EmptyState(),
          ),
          const Divider(),
          CartTotalAmount(
            totalAmount: totalAmount,
            onTapBuy: () {
              showPurchasedSnackbar(
                context,
                itemCount: myCartItems.length,
                totalAmount: totalAmount,
              );
              onClearItems();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
