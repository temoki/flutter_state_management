import 'package:app/common/data/item.dart';

sealed class Action {
  const Action._();
}

class RefreshCatalogItemsAction implements Action {
  const RefreshCatalogItemsAction();
}

class AddItemToMyCartAction implements Action {
  const AddItemToMyCartAction({required this.item});
  final Item item;
}

class RemoveItemFromMyCartAction implements Action {
  const RemoveItemFromMyCartAction({required this.item});
  final Item item;
}

class ClearMyCartAction implements Action {
  const ClearMyCartAction();
}
