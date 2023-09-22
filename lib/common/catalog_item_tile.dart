import 'package:flutter/material.dart';
import 'package:app/common/format_amount.dart';
import 'package:app/common/item.dart';

class CatalogItemTile extends StatelessWidget {
  const CatalogItemTile({
    super.key,
    required this.item,
    required this.isAdded,
    this.onTapAdd,
  });

  final Item item;
  final bool isAdded;
  final VoidCallback? onTapAdd;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        color: item.color,
      ),
      title: Row(
        children: [
          Text(item.name),
          const Spacer(),
          Text(formatAmount(item.price)),
        ],
      ),
      trailing: SizedBox(
        width: 50,
        child: Center(
          child: isAdded
              ? const Icon(Icons.check)
              : IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: onTapAdd,
                ),
        ),
      ),
    );
  }
}
