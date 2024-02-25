import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final interestsStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю интересы$'),
        (context, tester) async {
      await tester.implicitTap(interestsTestScreen.checkboxSport);
      await tester.implicitTap(interestsTestScreen.checkboxMusic);
      await tester.implicitTap(interestsTestScreen.checkboxFashion);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее$'),
        (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.trait);
      await tester.implicitTap(interestsTestScreen.nextBtn);
      await tester.pumpUntilVisible(placeResidenceTestScreen.trait);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанные интересы$'),
        (context, tester) async {
      final isSportSelected = (await tester.widget<Checkbox>(interestsTestScreen.checkboxSport)).value;
      final isMusicSelected = (await tester.widget<Checkbox>(interestsTestScreen.checkboxMusic)).value;
      final isFashionSelected = (await tester.widget<Checkbox>(interestsTestScreen.checkboxFashion)).value;

      expect(isSportSelected, true);
      expect(isMusicSelected, true); ///проверяем, что интересы выбраны
      expect(isFashionSelected, true);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Тогда я перехожу далее$'),
        (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.trait);
      await tester.implicitTap(interestsTestScreen.nextBtn);
      await tester.pumpUntilVisible(aboutmeTestScreen.trait);
    },
  ),

];