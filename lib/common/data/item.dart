import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required int id,
    required String name,
    required Color color,
    required int price,
  }) = _Item;
}
