import 'package:app/p1/p1_app.dart';
import 'package:app/p2/p2_app.dart';
import 'package:flutter/widgets.dart';

void main() {
  final p = int.tryParse(const String.fromEnvironment('P'));
  runApp(
    switch (p) {
      1 => const P1App(),
      2 => P2App(),
      _ => throw Exception('Unknown P value: $p'),
    },
  );
}
