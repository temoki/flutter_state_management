import 'dart:ui';

import 'item.dart';

Future<List<Item>> fetchCatalogItems() async {
  await Future.delayed(const Duration(seconds: 1));
  return const [
    Item(id: 1, name: "Code Smell", color: Color(0xFFE05140), price: 280),
    Item(id: 2, name: "Control Flow", color: Color(0xFFD53C63), price: 330),
    Item(id: 3, name: "Interpreter", color: Color(0xFF8F31AA), price: 110),
    Item(id: 4, name: "Recursion", color: Color(0xFF603BB0), price: 390),
    Item(id: 5, name: "Sprint", color: Color(0xFF4350B0), price: 270),
    Item(id: 6, name: "Heisenbug", color: Color(0xFF4D94EC), price: 180),
    Item(id: 7, name: "Spaghetti", color: Color(0xFF57A7Ef), price: 150),
    Item(id: 8, name: "Hydra Code", color: Color(0xFF5AAfD0), price: 450),
    Item(id: 9, name: "Off-By-One", color: Color(0xFF4A9389), price: 400),
    Item(id: 10, name: "Scope", color: Color(0xFF66AE5B), price: 320),
    Item(id: 11, name: "Callback", color: Color(0xFF98C15C), price: 160),
    Item(id: 12, name: "Closure", color: Color(0xFFCFDC59), price: 90),
    Item(id: 13, name: "Automata", color: Color(0xFFFAEB5F), price: 510),
    Item(id: 14, name: "Bit Shift", color: Color(0xFFF2C242), price: 240),
    Item(id: 15, name: "Currying", color: Color(0xFFEC9D38), price: 130),
  ];
}
