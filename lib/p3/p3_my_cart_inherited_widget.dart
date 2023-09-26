import 'package:app/common/data/my_cart_change_notifier.dart';
import 'package:flutter/widgets.dart';

class P3MyCartInheritedWidget extends InheritedWidget {
  const P3MyCartInheritedWidget({
    super.key,
    required super.child,
    required this.myCart,
  });

  // ⭐️ Expose ChangeNotifier through InheritedWidget.
  final MyCartChangeNotifier myCart;

  // ⭐️ Since ChangeNotifier has change notification function,
  //    update notification by InheritedWidget is not required.
  @override
  bool updateShouldNotify(P3MyCartInheritedWidget oldWidget) => false;

  // ⭐️ Static method `of` to get the InheritedWidget that is an ancestor of the Widget tree.
  static P3MyCartInheritedWidget of(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<P3MyCartInheritedWidget>()
        ?.widget as P3MyCartInheritedWidget?;
    if (widget != null) {
      return widget;
    }
    throw Exception('No P3InheritedMyCart found in context');
  }
}
