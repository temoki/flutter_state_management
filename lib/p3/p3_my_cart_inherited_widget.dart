import 'package:app/common/data/my_cart_change_notifier.dart';
import 'package:flutter/widgets.dart';

class P3MyCartInheritedWidget extends InheritedWidget {
  const P3MyCartInheritedWidget({
    super.key,
    required super.child,
    required this.myCart,
  });

  final MyCartChangeNotifier myCart;

  @override
  bool updateShouldNotify(P3MyCartInheritedWidget oldWidget) => false;

  static MyCartChangeNotifier of(
    BuildContext context, {
    bool listen = false,
  }) {
    final inheritedMyCart = listen
        ? context.dependOnInheritedWidgetOfExactType<P3MyCartInheritedWidget>()
        : context
            .getElementForInheritedWidgetOfExactType<P3MyCartInheritedWidget>()
            ?.widget as P3MyCartInheritedWidget?;
    if (inheritedMyCart != null) {
      return inheritedMyCart.myCart;
    }
    throw Exception('No P3InheritedMyCart found in context');
  }
}
