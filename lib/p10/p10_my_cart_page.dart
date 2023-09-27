import 'package:app/common/utility/show_purchased_snackbar.dart';
import 'package:app/common/widget/cart_item_tile.dart';
import 'package:app/common/widget/cart_total_amount.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/p10/p10_my_cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class P10MyCartPage extends StatelessWidget {
  const P10MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myCart = Provider.of<P10MyCartStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart (P10)'),
      ),
      // ⭐️ Use Consumer to listen to changes in ChangeNotifier.
      body: Column(
        children: [
          Observer(
            builder: (context) => Expanded(
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
          ),
          const Divider(),
          Observer(
            builder: (context) => CartTotalAmount(
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
          ),
        ],
      ),
    );
  }
}
