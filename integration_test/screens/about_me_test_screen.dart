import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/assets/strings/about_me_screen_strings.dart';
import 'package:profile/features/profile/widgets/next_button.dart';

import '../test_screen_library.dart';

class AboutmeTestScreen {
  /// Экран.
  final Finder trait = find.byType(AboutmeTestScreen);

  /// Поле ввода фамилии.
  Finder aboutmefield =
  generalTestScreen.textFormFieldWidget(
      AboutMeScreenStrings.fewWordsAboutYourselfHint);

  final Finder cancelBtn =
  find.descendant(of: find.byType(NextButton), matching: find.byType(ElevatedButton));
}