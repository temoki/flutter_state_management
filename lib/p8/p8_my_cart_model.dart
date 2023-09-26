import 'dart:collection';

import 'package:app/common/data/item.dart';
import 'package:scoped_model/scoped_model.dart';

// ⭐️ Include the state shared by multiple widgets and its update logic in the Model.
class P8MyCartModel extends Model {
  final Set<Item> _items = {};

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  bool contains(Item item) => _items.contains(item);

  int get totalAmount => _items.fold<int>(0, (sum, item) => sum + item.price);
}
