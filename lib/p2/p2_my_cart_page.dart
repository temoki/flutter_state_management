import 'package:flutter/material.dart';
import 'package:app/common/cart_item_tile.dart';
import 'package:app/common/cart_total_amount.dart';
import 'package:app/common/empty_state.dart';
import 'package:app/common/show_purchased_snackbar.dart';
import 'package:app/p2/p2_my_cart_model.dart';

class P2MyCartPage extends StatelessWidget {
  const P2MyCartPage({
    super.key,
    required this.myCart,
  });

  final P2MyCartModel myCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.of(context).canPop()
            ? BackButton(
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: const Text('Cart (P2)'),
      ),
      body: ListenableBuilder(
        listenable: myCart,
        builder: (context, _) => Column(
          children: [
            Expanded(
              child: myCart.items.isNotEmpty
                  ? ListView.builder(
                      itemCount: myCart.items.length,
                      itemBuilder: (context, index) {
                        final item = myCart.items[index];
                        return CartItemTile(
                          item: item,
                          onTapRemove: () => myCart.remove(item),
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
                myCart.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}