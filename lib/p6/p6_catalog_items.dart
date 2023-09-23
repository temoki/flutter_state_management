import 'package:app/common/data/fetch_catalog_items.dart';
import 'package:app/common/data/item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'p6_catalog_items.g.dart';

@riverpod
Future<List<Item>> p6CatalogItems(P6CatalogItemsRef ref) => fetchCatalogItems();
