import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.badgeCount,
    this.onPressed,
  });

  final int badgeCount;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text('$badgeCount'),
      isLabelVisible: badgeCount > 0,
      child: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: onPressed,
      ),
    );
  }
}
