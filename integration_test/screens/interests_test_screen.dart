import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/screens/interests_screen/interests_screen.dart';
import 'package:profile/features/profile/widgets/next_button.dart';


class InterestsTestScreen {
  /// Экран
  final Finder trait = find.byType(InterestsScreen);

  final Finder checkboxSport = find.byWidgetPredicate((widget) =>
  widget is Checkbox &&
      widget.toString().contains('Sport'), /// Ищем чекбокс с текстом 'Sport'
  );

  final Finder checkboxMusic = find.byWidgetPredicate((widget) =>
  widget is Checkbox &&
      widget.toString().contains('Music'), /// Ищем чекбокс с текстом 'Music'
  );

  final Finder checkboxFashion = find.byWidgetPredicate((widget) =>
  widget is Checkbox &&
      widget.toString().contains('Fashion'), /// Ищем чекбокс с текстом 'Fashion'
  );

  final Finder nextBtn = find.descendant(of: find.byType(NextButton), matching: find.byType(ElevatedButton));
}


