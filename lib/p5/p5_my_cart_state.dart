import 'package:app/common/data/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'p5_my_cart_state.freezed.dart';

@freezed
abstract class P5MyCartState implements _$P5MyCartState {
  const factory P5MyCartState({
    @Default([]) List<Item> items,
  }) = _P5MyCartState;

  const P5MyCartState._();

  int get totalAmount => items.fold<int>(0, (sum, item) => sum + item.price);
}
