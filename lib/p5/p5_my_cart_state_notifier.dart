import 'package:app/common/data/item.dart';
import 'package:app/common/data/my_cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: lines_longer_than_80_chars
// ⭐️ Provide a StateNotifier containing the state and its update logic via StateNotifierProvider.
final p5MyCartStateNotifierProvider =
    StateNotifierProvider<P5MyCartStateNotifier, MyCartState>(
  (ref) => P5MyCartStateNotifier(),
);

class P5MyCartStateNotifier extends StateNotifier<MyCartState> {
  P5MyCartStateNotifier() : super(const MyCartState());

  void add(Item item) {
    if (!state.items.contains(item)) {
      state = state.copyWith(items: {...state.items, item});
    }
  }

  void remove(Item item) {
    if (state.items.contains(item)) {
      state = state.copyWith(items: <Item>{...state.items}..remove(item));
    }
  }

  void clear() {
    state = const MyCartState();
  }
}
