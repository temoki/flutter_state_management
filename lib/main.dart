import 'package:app/p1/p1_app.dart';
import 'package:app/p2/p2_app.dart';
import 'package:app/p3/p3_app.dart';
import 'package:app/p4/p4_app.dart';
import 'package:app/p5/p5_app.dart';
import 'package:app/p6/p6_app.dart';
import 'package:app/p7/p7_app.dart';
import 'package:app/p8/p8_app.dart';
import 'package:flutter/widgets.dart';

void main() {
  final p = int.tryParse(const String.fromEnvironment('P'));
  runApp(
    switch (p) {
      1 => const P1App(),
      2 => P2App(),
      3 => const P3App(),
      4 => const P4App(),
      5 => const P5App(),
      6 => const P6App(),
      7 => const P7App(),
      8 => const P8App(),
      _ => throw Exception('Unknown P value: $p'),
    },
  );
}
