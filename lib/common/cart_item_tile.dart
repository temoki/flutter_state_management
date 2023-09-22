import 'package:flutter/material.dart';
import 'package:app/common/format_amount.dart';
import 'package:app/common/item.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.item,
    this.onTapRemove,
  });

  final Item item;
  final VoidCallback? onTapRemove;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(item.name),
          const Spacer(),
          Text(formatAmount(item.price)),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onTapRemove,
      ),
    );
  }
}
