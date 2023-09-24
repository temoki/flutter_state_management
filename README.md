# Flutter state management
Implementations of the app example from the [Simple app state management](https://docs.flutter.dev/data-and-backend/state-mgmt/simple) page of the official Flutter documentation, with various state management patterns.

| Catalog | My Cart |
| :-: | :-: |
| <img width="300" src="./resources/screenshot1.png" /> | <img width="300" src="./resources/screenshot2.png" /> |

## Patterns

| No. | Pattern | Code |
| --- | --- | --- |
| P1 | [StatefulWidget only](#p1--statefulwidget-only) | [lib/p1](./lib/p1) |
| P2 | [ChangeNotifier](#p2--changenotifier) | [lib/p2](./lib/p2) |
| P3 | [ChangeNotifier + InheritedWidget](#p3--changenotifier--inheritedwidget) | [lib/p3](./lib/p3) |
| P4 | ChangeNotifierProvider (Provider package) | [lib/p4](./lib/p4) |
| P5 | Riverpod | [lib/p5](./lib/p5) |
| P6 | Riverpod Generator | [lib/p6](./lib/p6) |

### P1 / StatefulWidget only
- Lift up the state shared by multiple widgets to their parent widget.
- Relay that state to any descendant widget that needs it.
- Events that require state updates are also lifted up.

```dart
// lib/p1/p1_app.dart

class _P1AppState extends State<P1App> {
  // ⭐️ Lift up the state shared by multiple widgets to their parent `StatefulWidget`.
  final Set<Item> myCartItems = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => P1CatalogPage(
              // ⭐️ Relay that state to any descendant widget that needs it.
              myCartItems: myCartItems.toList(),
              // ⭐️ Events that require state updates are also lifted up.
              onAddItem: (item) => setState(
                () => myCartItems.add(item),
              ),
            ),
```

### P2 / ChangeNotifier
- Include the state shared by multiple widgets and its update logic in the ChangeNotifier.
```dart
// lib/common/data/my_cart_change_notifier.dart

// ⭐️ Include the state shared by multiple widgets and its update logic in the ChangeNotifier.
class MyCartChangeNotifier with ChangeNotifier {
  final Set<Item> _items = {};

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void add(Item item) { ... }

  void remove(Item item) { ... }
```

- Keep ChangeNotifier in the parent widget of multiple widgets that require it.
- Relay that ChangeNotifier to any descendant widget that needs it.
```dart
// lib/p2/p2_app.dart

class P2App extends StatelessWidget {
  P2App({super.key});

  // ⭐️ Keep ChangeNotifier in the parent widget of multiple widgets that require it.
  final myCart = MyCartChangeNotifier();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        // ⭐️ Relay that ChangeNotifier to any descendant widget that needs it.
        '/': (context) => P2CatalogPage(myCart: myCart),
```

- Wrap widgets affected by ChangeNotifier updates in ListenableBuilder.
```dart
// lib/p2/p2_my_cart_page.dart

class P2MyCartPage extends StatelessWidget {
  const P2MyCartPage({super.key, required this.myCart});

  final MyCartChangeNotifier myCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart (P2)'),
      ),
      // ⭐️ Wrap widgets affected by ChangeNotifier updates in ListenableBuilder.
      body: ListenableBuilder(
        listenable: myCart,
        builder: (context, child) => Column(
          children: [
            Expanded(
              child: myCart.items.isNotEmpty
                  ? ListView.builder(
                      itemCount: myCart.items.length,
                      itemBuilder: (context, index) {
                        final item = myCart.items[index];
                        return CartItemTile(
                          item: item,
                          onTapRemove: () => myCart.remove(item),
                        );
                      },
                    )
                  : const EmptyState(),
            ),
```
### P3 / ChangeNotifier + InheritedWidget
- Expose ChangeNotifier through InheritedWidget.
- Since ChangeNotifier has change notification function, update notification by InheritedWidget is not required.
- Static method `of` to get the InheritedWidget that is an ancestor of the Widget tree.
```dart
// lib/p3/p3_my_cart_inherited_widget

class P3MyCartInheritedWidget extends InheritedWidget {
  const P3MyCartInheritedWidget({
    super.key, required super.child, required this.myCart});

  // ⭐️ Expose ChangeNotifier through InheritedWidget.
  final MyCartChangeNotifier myCart;

  // ⭐️ Since ChangeNotifier has change notification function,
  //    update notification by InheritedWidget is not required.
  @override
  bool updateShouldNotify(P3MyCartInheritedWidget oldWidget) => false;

  // ⭐️ Static method `of` to get the InheritedWidget that is an ancestor of the Widget tree.
  static P3MyCartInheritedWidget of(BuildContext context) {
```

- Insert InheritedWidget with ChangeNotifier in Widget tree.
```dart
// lib/p3/p3_app.dart

class P3App extends StatelessWidget {
  P3App({super.key});

  final myCart = MyCartChangeNotifier();

  @override
  Widget build(BuildContext context) {
    // ⭐️ Insert InheritedWidget with ChangeNotifier in Widget tree.
    return P3MyCartInheritedWidget(
      myCart: myCart,
      child: MaterialApp(
```

- Get ChangeNotifier through InheritedWidget.
```dart
// lib/p3/p3_my_cart_page.dart

class P3MyCartPage extends StatelessWidget {
  const P3MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ⭐️ Get ChangeNotifier through InheritedWidget.
    final myCart = P3MyCartInheritedWidget.of(context).myCart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart (P3)'),
      ),
      body: ListenableBuilder(
        listenable: myCart,
        builder: (context, child) => Column(
```

### P4 / ChangeNotifierProvider (Provider package)

_T.B.D._

### P5 / Riverpod

_T.B.D._

### P6 / Riverpod Generator

_T.B.D._
