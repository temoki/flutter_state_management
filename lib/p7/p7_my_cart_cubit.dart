import 'package:app/common/data/item.dart';
import 'package:app/common/data/my_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: lines_longer_than_80_chars
// ⭐️ Include the state shared by multiple widgets and its update logic in the Cubit.
class P7MyCartCubit extends Cubit<MyCartState> {
  P7MyCartCubit() : super(const MyCartState());

  void add(Item item) {
    if (!state.items.contains(item)) {
      emit(state.copyWith(items: {...state.items, item}));
    }
  }

  void remove(Item item) {
    if (state.items.contains(item)) {
      final newItems = {...state.items};
      final _ = newItems.remove(item);
      emit(state.copyWith(items: newItems));
    }
  }

  void clear() {
    emit(const MyCartState());
  }
}
