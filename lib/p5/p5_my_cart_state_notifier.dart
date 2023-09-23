import 'package:app/common/data/item.dart';
import 'package:app/p5/p5_my_cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final p5MyCartStateNotifierProvider =
    StateNotifierProvider<P5MyCartStateNotifier, P5MyCartState>(
  (ref) => P5MyCartStateNotifier(),
);

class P5MyCartStateNotifier extends StateNotifier<P5MyCartState> {
  P5MyCartStateNotifier() : super(const P5MyCartState());

  void add(Item item) {
    if (!state.items.contains(item)) {
      state = state.copyWith(items: <Item>{...state.items, item});
    }
  }

  void remove(Item item) {
    if (state.items.contains(item)) {
      final newItems = <Item>{...state.items};
      final _ = newItems.remove(item);
      state = state.copyWith(items: newItems);
    }
  }

  void clear() {
    state = const P5MyCartState();
  }
}
