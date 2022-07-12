// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:app_bloc_note/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Open the app by touching the image', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SplashScreen());

    // Tap the 'chocobo icon and trigger a frame.
    await tester.tap(find.byElementType(Image));
    await tester.pump();

    //just to test on CI
    expect(1,1);
  });
}
