import 'package:flutter/material.dart';
import 'package:app/common/format_amount.dart';

void showPurchasedSnackbar(
  BuildContext context, {
  required int boughtItemCount,
  required int totalAmount,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'You purchased $boughtItemCount items. The total amount is ${formatAmount(totalAmount)}.',
      ),
    ),
  );
}
