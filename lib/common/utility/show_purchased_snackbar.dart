import 'package:flutter/material.dart';
import 'format_amount.dart';

void showPurchasedSnackbar(
  BuildContext context, {
  required int itemCount,
  required int totalAmount,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        // ignore: lines_longer_than_80_chars
        'You purchased $itemCount items. The total amount is ${formatAmount(totalAmount)}.',
      ),
    ),
  );
}
