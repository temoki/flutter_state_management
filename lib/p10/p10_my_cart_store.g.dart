// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p10_my_cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$P10MyCartStore on P10MyCartStoreBase, Store {
  Computed<UnmodifiableListView<Item>>? _$itemsComputed;

  @override
  UnmodifiableListView<Item> get items => (_$itemsComputed ??=
          Computed<UnmodifiableListView<Item>>(() => super.items,
              name: 'P10MyCartStoreBase.items'))
      .value;
  Computed<int>? _$totalAmountComputed;

  @override
  int get totalAmount =>
      (_$totalAmountComputed ??= Computed<int>(() => super.totalAmount,
              name: 'P10MyCartStoreBase.totalAmount'))
          .value;

  late final _$_itemsAtom =
      Atom(name: 'P10MyCartStoreBase._items', context: context);

  @override
  Set<Item> get _items {
    _$_itemsAtom.reportRead();
    return super._items;
  }

  @override
  set _items(Set<Item> value) {
    _$_itemsAtom.reportWrite(value, super._items, () {
      super._items = value;
    });
  }

  late final _$P10MyCartStoreBaseActionController =
      ActionController(name: 'P10MyCartStoreBase', context: context);

  @override
  void add(Item item) {
    final _$actionInfo = _$P10MyCartStoreBaseActionController.startAction(
        name: 'P10MyCartStoreBase.add');
    try {
      return super.add(item);
    } finally {
      _$P10MyCartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(Item item) {
    final _$actionInfo = _$P10MyCartStoreBaseActionController.startAction(
        name: 'P10MyCartStoreBase.remove');
    try {
      return super.remove(item);
    } finally {
      _$P10MyCartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$P10MyCartStoreBaseActionController.startAction(
        name: 'P10MyCartStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$P10MyCartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
totalAmount: ${totalAmount}
    ''';
  }
}
