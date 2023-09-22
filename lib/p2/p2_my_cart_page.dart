import 'package:flutter/material.dart';
import 'package:app/common/cart_item_tile.dart';
import 'package:app/common/cart_total_amount.dart';
import 'package:app/common/empty_state.dart';
import 'package:app/common/show_purchased_snackbar.dart';
import 'package:app/p2/p2_my_cart_model.dart';

class P2MyCartPage extends StatelessWidget {
  const P2MyCartPage({
    super.key,
    required this.cart,
  });

  final P2MyCartModel cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.of(context).canPop()
            ? BackButton(
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: const Text('Cart@P2'),
      ),
      body: ListenableBuilder(
        listenable: cart,
        builder: (context, _) => Column(
          children: [
            Expanded(
              child: cart.items.isNotEmpty
                  ? ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        return CartItemTile(
                          item: item,
                          onTapRemove: () => cart.remove(item),
                        );
                      },
                    )
                  : const EmptyState(),
            ),
            const Divider(),
            CartTotalAmount(
              totalAmount: cart.totalAmount,
              onTapBuy: () {
                showPurchasedSnackbar(
                  context,
                  boughtItemCount: cart.items.length,
                  totalAmount: cart.totalAmount,
                );
                cart.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
