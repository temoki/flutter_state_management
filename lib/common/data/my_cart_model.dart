import 'dart:collection';

import 'package:app/common/data/item.dart';
import 'package:flutter/material.dart';
import 'package:ordered_set/ordered_set.dart';

class MyCartModel with ChangeNotifier {
  final OrderedSet<Item> _items = OrderedSet();

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