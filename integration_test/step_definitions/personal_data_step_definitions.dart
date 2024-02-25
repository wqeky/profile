import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final personalDataStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю фамилию$'),
        (context, tester) async {
      await tester.implicitEnterText(
          personalDataTestScreen.surnameField, 'Rogers');
    },
  ),

  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю имя$'),
        (context, tester) async {
      await tester.implicitEnterText(
          personalDataTestScreen.nameField, 'John');
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю отчество$'),
        (context, tester) async {
      await tester.implicitEnterText(
          personalDataTestScreen.secondNameField, 'James');
    },
  ),

  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю дату рождения$'),
        (context, tester) async {
      final calendar =
      tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField);
      calendar.controller?.text = '1980-04-08';
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее$'),
        (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.trait);
      await tester.implicitTap(personalDataTestScreen.nextBtn);
      await tester.pumpUntilVisible(placeResidenceTestScreen.trait);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанные ФИО и дату рождения$'),
        (context, tester) async {
      final nameText = (await tester.widget<Text>(personalDataTestScreen.nameField)).data;
      final surnameText = (await tester.widget<Text>(personalDataTestScreen.surnameField)).data;
      final secondNameText = (await tester.widget<Text>(personalDataTestScreen.secondNameField)).data;
      final dateOfBirthText = (await tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField)).controller?.text;
      expect('$nameText, $surnameText, $secondNameText, $dateOfBirthText', 'Указанное имя, Указанная фамилия, Указанное отчество, Указанная дата рождения');
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее$'),
        (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.trait);
      await tester.implicitTap(personalDataTestScreen.nextBtn);
      await tester.pumpUntilVisible(placeResidenceTestScreen.trait);
    },
  ),

];

