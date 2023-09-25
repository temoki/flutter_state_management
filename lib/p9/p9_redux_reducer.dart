import 'package:app/common/data/fetch_catalog_items.dart';
import 'package:app/common/data/my_cart_state.dart';
import 'package:app/p9/p9_redux_actions.dart';
import 'package:app/p9/p9_redux_state.dart';

P9ReduxState reducer(P9ReduxState state, dynamic action) {
  if (action is Action) {
    return switch (action) {
      RefreshCatalogItemsAction() => state.copyWith(
          catalogItems: fetchCatalogItems(),
        ),
      AddItemToMyCartAction(item: final item) => state.copyWith(
          myCart: state.myCart.copyWith(
            items: {...state.myCart.items, item},
          ),
        ),
      RemoveItemFromMyCartAction(item: final item) => state.copyWith(
          myCart: state.myCart.copyWith(
            items: {...state.myCart.items}..remove(item),
          ),
        ),
      ClearMyCartAction() => state.copyWith(
          myCart: const MyCartState(),
        ),
    };
  }
  return state;
}
