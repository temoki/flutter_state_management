import 'package:app/common/data/my_cart_model.dart';
import 'package:flutter/widgets.dart';

class P3InheritedMyCart extends InheritedWidget {
  const P3InheritedMyCart({
    super.key,
    required super.child,
    required this.myCart,
  });

  final MyCartModel myCart;

  @override
  bool updateShouldNotify(P3InheritedMyCart oldWidget) => false;

  static MyCartModel of(
    BuildContext context, {
    bool listen = false,
  }) {
    final inheritedMyCart = listen
        ? context.dependOnInheritedWidgetOfExactType<P3InheritedMyCart>()
        : context
            .getElementForInheritedWidgetOfExactType<P3InheritedMyCart>()
            ?.widget as P3InheritedMyCart?;
    if (inheritedMyCart != null) {
      return inheritedMyCart.myCart;
    }
    throw Exception('No P3InheritedMyCart found in context');
  }
}
