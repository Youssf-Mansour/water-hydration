import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assignment/main.dart';

void main() {
  testWidgets('InputScreen renders correct UI components', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WaterTrackerApp());

    // Verify app title in AppBar
    expect(find.text('DAILY WATER TRACKER'), findsOneWidget);

    // Verify Gender Cards
    expect(find.text('MALE'), findsOneWidget);
    expect(find.text('FEMALE'), findsOneWidget);

    // Verify Activity Hours Slider Card
    expect(find.text('DAILY ACTIVITY HOURS'), findsOneWidget);

    // Verify Weight and Age Counter Cards
    expect(find.text('WEIGHT'), findsOneWidget);
    expect(find.text('AGE'), findsOneWidget);

    // Verify Calculate Button
    expect(find.text('CALCULATE WATER INTAKE'), findsOneWidget);
  });

  testWidgets('Navigation to ResultScreen works properly', (WidgetTester tester) async {
    await tester.pumpWidget(const WaterTrackerApp());

    // Tap Calculate button
    await tester.tap(find.text('CALCULATE WATER INTAKE'));
    await tester.pumpAndSettle();

    // Verify ResultScreen elements
    expect(find.text('WATER TRACKER RESULT'), findsOneWidget);
    expect(find.text('Your Daily Water Intake'), findsOneWidget);
    expect(find.text('RE-CALCULATE'), findsOneWidget);

    // Tap Re-calculate button to navigate back
    await tester.tap(find.text('RE-CALCULATE'));
    await tester.pumpAndSettle();

    // Verify back on InputScreen
    expect(find.text('DAILY WATER TRACKER'), findsOneWidget);
  });
}
