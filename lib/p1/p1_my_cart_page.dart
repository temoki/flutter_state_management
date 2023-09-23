import 'package:app/common/item.dart';
import 'package:app/common/cart_item_tile.dart';
import 'package:app/common/cart_total_amount.dart';
import 'package:app/common/empty_state.dart';
import 'package:app/common/show_purchased_snackbar.dart';
import 'package:flutter/material.dart';

class P1MyCartPage extends StatelessWidget {
  const P1MyCartPage({
    super.key,
    required this.myCartItems,
    required this.onRemoveItem,
    required this.onClearItems,
  });

  final List<Item> myCartItems;
  final Function(Item) onRemoveItem;
  final VoidCallback onClearItems;

  @override
  Widget build(BuildContext context) {
    final totalAmount =
        myCartItems.fold<int>(0, (sum, item) => sum + item.price);
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.of(context).canPop()
            ? BackButton(
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: const Text('Cart (P1)'),
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
