import 'package:app/common/data/item.dart';
import 'package:app/common/data/my_cart_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'p9_redux_state.freezed.dart';

@freezed
class P9ReduxState with _$P9ReduxState {
  const factory P9ReduxState({
    required Future<List<Item>> catalogItems,
    required MyCartState myCart,
  }) = _P9ReduxState;
}
