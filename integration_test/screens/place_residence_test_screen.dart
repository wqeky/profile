import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/assets/strings/place_residence_screen_strings.dart';
import 'package:profile/features/profile/screens/place_residence/place_residence_screen.dart';
import 'package:profile/features/profile/widgets/next_button.dart';
import '../test_screen_library.dart';

class PlaceResidenceTestScreen {
  /// Экран.
  final Finder trait = find.byType(PlaceResidenceScreen);

  Finder placeResidenceField =
  generalTestScreen.textFormFieldWidget(PlaceResidenceScreenStrings.placeResidenceTitle);

  final Finder nextBtn =
  find.descendant(of: find.byType(NextButton), matching: find.byType(ElevatedButton));
}

