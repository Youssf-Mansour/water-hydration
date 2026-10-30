import 'package:flutter/material.dart';
import '../widgets/bottom_button.dart';
import '../utils/water_calculator.dart';

class ResultScreen extends StatelessWidget {
  final double litres;
  final int weight;
  final int age;
  final double activityHours;
  final String gender;

  const ResultScreen({
    super.key,
    required this.litres,
    required this.weight,
    required this.age,
    required this.activityHours,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    const cardColor = Color(0xFF1D1E33);
    const labelColor = Color(0xFF8D8E98);
    const accentColor = Color(0xFF00E5FF);

    final String advice = getHydrationAdvice(litres);
    final int glasses = calculateGlasses(litres);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WATER TRACKER RESULT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Your Daily Water Intake',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Main Result Card
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withOpacity(0.08),
                      blurRadius: 15,
                      spreadRadius: 2,
                    )
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Water Drop / Gauge Visual
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 130,
                            height: 130,
                            child: CircularProgressIndicator(
                              value: (litres / 5.0).clamp(0.0, 1.0), // Gauge scaled to 5L max
                              strokeWidth: 10,
                              backgroundColor: Colors.white10,
                              valueColor: const AlwaysStoppedAnimation<Color>(accentColor),
                            ),
                          ),
                          const Icon(
                            Icons.water_drop,
                            size: 55.0,
                            color: accentColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),

                      // Large Litres Display
                      Text(
                        '${litres.toStringAsFixed(2)} L',
                        style: const TextStyle(
                          fontSize: 46.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'RECOMMENDED PER DAY',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: labelColor,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Glasses Counter Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF111328),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: accentColor.withOpacity(0.4)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.local_drink, color: accentColor, size: 20.0),
                            const SizedBox(width: 8.0),
                            Text(
                              '~$glasses Standard Glasses (250 ml)',
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      // Summary Chips
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _SummaryChip(label: 'Weight', value: '$weight kg'),
                          _SummaryChip(label: 'Activity', value: '${activityHours.toStringAsFixed(1)} h'),
                          _SummaryChip(label: 'Gender', value: gender),
                          _SummaryChip(label: 'Age', value: '$age yrs'),
                        ],
                      ),
                      const SizedBox(height: 20.0),

                      // Hydration Advice Box
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF111328),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          advice,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14.0,
                            height: 1.4,
                            color: Color(0xFFE2E8F0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Re-calculate Button
            BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryChip({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8D8E98),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
