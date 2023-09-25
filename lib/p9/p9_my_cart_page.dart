import 'package:app/common/utility/show_purchased_snackbar.dart';
import 'package:app/common/widget/cart_item_tile.dart';
import 'package:app/common/widget/cart_total_amount.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/p9/p9_redux_actions.dart';
import 'package:app/p9/p9_redux_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class P9MyCartPage extends StatelessWidget {
  const P9MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart (P9)'),
      ),
      body: StoreBuilder<P9ReduxState>(
        builder: (context, store) => Column(
          children: [
            Expanded(
              child: store.state.myCart.items.isNotEmpty
                  ? ListView.builder(
                      itemCount: store.state.myCart.items.length,
                      itemBuilder: (context, index) {
                        final item = store.state.myCart.items.elementAt(index);
                        return CartItemTile(
                          item: item,
                          onTapRemove: () => store.dispatch(
                            RemoveItemFromMyCartAction(item: item),
                          ),
                        );
                      },
                    )
                  : const EmptyState(),
            ),
            const Divider(),
            CartTotalAmount(
              totalAmount: store.state.myCart.totalAmount,
              onTapBuy: () {
                showPurchasedSnackbar(
                  context,
                  itemCount: store.state.myCart.items.length,
                  totalAmount: store.state.myCart.totalAmount,
                );
                store.dispatch(const ClearMyCartAction());
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
