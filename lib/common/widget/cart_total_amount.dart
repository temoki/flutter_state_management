import 'package:flutter/material.dart';
import 'package:app/common/utility/format_amount.dart';

class CartTotalAmount extends StatelessWidget {
  const CartTotalAmount({
    super.key,
    required this.totalAmount,
    this.onTapBuy,
  });

  final int totalAmount;
  final VoidCallback? onTapBuy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            formatAmount(totalAmount),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          if (totalAmount > 0)
            ElevatedButton(
              onPressed: onTapBuy,
              child: const Text('Buy'),
            ),
        ],
      ),
    );
  }
}
