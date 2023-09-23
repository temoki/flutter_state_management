import 'package:app/common/utility/show_purchased_snackbar.dart';
import 'package:app/common/widget/cart_item_tile.dart';
import 'package:app/common/widget/cart_total_amount.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/p3/p3_inherited_my_cart.dart';
import 'package:flutter/material.dart';

class P3MyCartPage extends StatelessWidget {
  const P3MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myCart = P3InheritedMyCart.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.of(context).canPop()
            ? BackButton(
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: const Text('Cart (P3)'),
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
