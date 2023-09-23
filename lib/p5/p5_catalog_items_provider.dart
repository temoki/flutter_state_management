import 'package:app/common/data/fetch_catalog_items.dart';
import 'package:app/common/data/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final p5CatalogItemsProvider = FutureProvider<List<Item>>(
  (ref) => fetchCatalogItems(),
);
