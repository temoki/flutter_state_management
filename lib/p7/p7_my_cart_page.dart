import 'package:app/common/data/my_cart_state.dart';
import 'package:app/common/utility/show_purchased_snackbar.dart';
import 'package:app/common/widget/cart_item_tile.dart';
import 'package:app/common/widget/cart_total_amount.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/p7/p7_my_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class P7MyCartPage extends StatelessWidget {
  const P7MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart (P7)'),
      ),
      // ⭐️ Use BlocBuilder to listen to changes in the Cubit.
      body: BlocBuilder<P7MyCartCubit, MyCartState>(
        builder: (context, myCart) => Column(
          children: [
            Expanded(
              child: myCart.items.isNotEmpty
                  ? ListView.builder(
                      itemCount: myCart.items.length,
                      itemBuilder: (context, index) {
                        final item = myCart.items.elementAt(index);
                        return CartItemTile(
                          item: item,
                          // ⭐️ Update state with Cubit.
                          onTapRemove: () =>
                              context.read<P7MyCartCubit>().remove(item),
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
                context.read<P7MyCartCubit>().clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
