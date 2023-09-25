import 'package:app/common/utility/show_purchased_snackbar.dart';
import 'package:app/common/widget/cart_item_tile.dart';
import 'package:app/common/widget/cart_total_amount.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/p8/p8_my_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class P8MyCartPage extends StatelessWidget {
  const P8MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart (P8)'),
      ),
      // ⭐️ Use ScopedModelDescendant to listen to changes in the Model.
      body: ScopedModelDescendant<P8MyCartModel>(
        builder: (context, child, myCart) => Column(
          children: [
            Expanded(
              child: myCart.items.isNotEmpty
                  ? ListView.builder(
                      itemCount: myCart.items.length,
                      itemBuilder: (context, index) {
                        final item = myCart.items.elementAt(index);
                        return CartItemTile(
                          item: item,
                          // ⭐️ Update state with Model.
                          onTapRemove: () =>
                              ScopedModel.of<P8MyCartModel>(context)
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
                ScopedModel.of<P8MyCartModel>(context).clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
