
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/screens/place_residence/widgets/field_with_suggestions_widget/field_with_suggestions_widget.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final placeResidenceStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я выбираю город$'),
        (context, tester) async {
      final textFieldFinder = find.byType(TextFormField);
      expect(textFieldFinder, findsOneWidget); // Убедимся, что поле одно
      await tester.enterText(textFieldFinder, 'Voronezh');
      await tester.pumpAndSettle();
      final suggestionFinder = find.text('Voronezh');
      expect(suggestionFinder, findsOneWidget); // Убедимся, что нашли только один элемент

     ///этот шаг будет завален, список открывается, но тап не происходит, перепробовала много вариков, но не вышло(
      await tester.implicitTap(suggestionFinder);
      await tester.pumpAndSettle();
    },
  ),

  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее$'),
      (context, tester) async {
      await tester.pumpUntilVisible(placeResidenceTestScreen.trait);
      await tester.implicitTap(placeResidenceTestScreen.nextBtn);
      await tester.pumpUntilVisible(interestsTestScreen.trait);
},
),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанный город$'),
        (context, tester) async {
      var placeResidenceText = (await tester.widget(placeResidenceTestScreen.placeResidenceField)) as Text;
      expect(placeResidenceText.data, 'Voronezh');
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее$'),
        (context, tester) async {
      await tester.pumpUntilVisible(placeResidenceTestScreen.trait);
      await tester.implicitTap(placeResidenceTestScreen.nextBtn);
      await tester.pumpUntilVisible(interestsTestScreen.trait);
    },
  ),

];