import 'package:app/common/data/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_cart_state.freezed.dart';

@freezed
abstract class MyCartState implements _$MyCartState {
  const factory MyCartState({
    @Default({}) Set<Item> items,
  }) = _MyCartState;

  const MyCartState._();

  int get totalAmount => items.fold<int>(0, (sum, item) => sum + item.price);
}
