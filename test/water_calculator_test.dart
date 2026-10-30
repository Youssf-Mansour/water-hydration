import 'package:flutter_test/flutter_test.dart';
import 'package:assignment/utils/water_calculator.dart';

void main() {
  group('Water Calculator Logic Tests', () {
    test('Test Case 1: Weight 50kg, Activity 0h -> 1.75 L/Day', () {
      final double result = calculateWaterLitres(
        weightKg: 50,
        activityHours: 0.0,
      );
      expect(double.parse(result.toStringAsFixed(2)), equals(1.75));
    });

    test('Test Case 2: Weight 60kg, Activity 8h -> 4.10 L/Day', () {
      final double result = calculateWaterLitres(
        weightKg: 60,
        activityHours: 8.0,
      );
      expect(double.parse(result.toStringAsFixed(2)), equals(4.10));
    });

    test('Test Case 3: Weight 70kg, Activity 2h -> 2.95 L/Day', () {
      final double result = calculateWaterLitres(
        weightKg: 70,
        activityHours: 2.0,
      );
      expect(double.parse(result.toStringAsFixed(2)), equals(2.95));
    });

    test('Test Case 4: Weight 90kg, Activity 4h -> 4.15 L/Day', () {
      final double result = calculateWaterLitres(
        weightKg: 90,
        activityHours: 4.0,
      );
      expect(double.parse(result.toStringAsFixed(2)), equals(4.15));
    });

    test('Glasses calculation test', () {
      expect(calculateGlasses(1.75), equals(7));
      expect(calculateGlasses(2.95), equals(12));
    });
  });
}
