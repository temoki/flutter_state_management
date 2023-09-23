import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
class Item implements Comparable<Item> {
  const Item({
    required this.id,
    required this.name,
    required this.color,
    required this.price,
  });

  final int id;
  final String name;
  final Color color;
  final int price;

  Item copyWith({
    int? id,
    String? name,
    Color? color,
    int? price,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      price: price ?? this.price,
    );
  }

  @override
  int compareTo(Item other) => id.compareTo(other.id);
}
