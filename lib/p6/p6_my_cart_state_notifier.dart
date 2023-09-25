import 'package:app/common/data/item.dart';
import 'package:app/common/data/my_cart_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'p6_my_cart_state_notifier.g.dart';

// ⭐️ Automatically generate an appropriate provider using @riverpod annotation.
@riverpod
class P6MyCartStateNotifier extends _$P6MyCartStateNotifier {
  @override
  MyCartState build() => const MyCartState();

  void add(Item item) {
    if (!state.items.contains(item)) {
      state = state.copyWith(items: {...state.items, item});
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
    state = const MyCartState();
  }
}
