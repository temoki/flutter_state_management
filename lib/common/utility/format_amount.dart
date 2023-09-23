import 'package:intl/intl.dart';

String formatAmount(num amount) => '\$${NumberFormat('#,###').format(amount)}';
