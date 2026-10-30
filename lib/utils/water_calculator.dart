/// Utility functions for calculating daily water intake and providing hydration advice.

/// Calculates daily water intake in litres based on body weight in kg
/// and physical activity duration in hours.
double calculateWaterLitres({
  required int weightKg,
  required double activityHours,
}) {
  // Base requirement: 35 ml per kg of body weight
  final double baseMl = weightKg * 35.0;

  // Additional requirement: 250 ml per hour of physical activity
  final double activityMl = activityHours * 250.0;

  // Total requirement in millilitres
  final double totalMl = baseMl + activityMl;

  // Convert to litres
  return totalMl / 1000.0;
}

/// Provides personalized hydration advice based on calculated intake in litres.
String getHydrationAdvice(double litres) {
  if (litres < 2.0) {
    return 'Light Hydration Goal: Suitable for baseline daily activity. Remember to sip water consistently throughout your day.';
  } else if (litres <= 3.5) {
    return 'Optimal Hydration Goal: Ideal target for healthy body function, metabolism, and focus. Keep a water bottle nearby!';
  } else {
    return 'High Hydration Goal: Increased fluid needs due to intense activity or weight. Space your water intake evenly throughout the day.';
  }
}

/// Estimates recommended number of standard glasses (250 ml each).
int calculateGlasses(double litres) {
  return (litres * 1000 / 250).round();
}
