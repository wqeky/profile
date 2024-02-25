import 'package:flutter/widgets.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final aboutmeStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю информацию о себе и сохраняю данные$'),
      (context, tester) async {
      await tester.implicitEnterText(
      aboutmeTestScreen.aboutmefield, '20 y.o designer from Saint-Petersburg');
      },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу к редактированию профиля$'),
        (context, tester) async {
      await tester.pumpUntilVisible(aboutmeTestScreen.trait);
      await tester.implicitTap(aboutmeTestScreen.cancelBtn);
      await tester.pumpUntilVisible(mainTestScreen.trait);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанную информацию о себе$'),
        (context, tester) async {
      final aboutMeText = (await tester.widget<Text>(aboutmeTestScreen.aboutmefield)).data;
      expect(aboutMeText, '20 y.o designer from Saint-Petersburg');
    },
  ),

];
