import 'package:flutter/material.dart';
import 'package:app/common/format_amount.dart';

void showPurchasedSnackbar(
  BuildContext context, {
  required int itemCount,
  required int totalAmount,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'You purchased $itemCount items. The total amount is ${formatAmount(totalAmount)}.',
      ),
    ),
  );
}
