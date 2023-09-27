import 'dart:collection';

import 'package:app/common/data/item.dart';
import 'package:mobx/mobx.dart';

part 'p10_my_cart_store.g.dart';

// ⭐️ Include the state shared by multiple widgets and its update logic in the ChangeNotifier.
class P10MyCartStore = P10MyCartStoreBase with _$P10MyCartStore;

abstract class P10MyCartStoreBase with Store {
  @observable
  // ignore: prefer_final_fields
  Set<Item> _items = {};

  @computed
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  @action
  void add(Item item) {
    if (!_items.contains(item)) {
      _items = {..._items, item};
    }
  }

  @action
  void remove(Item item) {
    if (_items.contains(item)) {
      _items = _items..remove(item);
    }
  }

  @action
  void clear() {
    _items = {};
  }

  bool contains(Item item) => _items.contains(item);

  @computed
  int get totalAmount => _items.fold<int>(0, (sum, item) => sum + item.price);
}
