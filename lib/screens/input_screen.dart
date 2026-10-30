import 'package:flutter/material.dart';
import '../widgets/gender_card.dart';
import '../widgets/counter_card.dart';
import '../widgets/bottom_button.dart';
import '../utils/water_calculator.dart';
import 'result_screen.dart';

enum Gender { male, female }

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender selectedGender = Gender.male;
  int weight = 70; // Default weight in kg
  int age = 25; // Default age in years
  double activityHours = 2.0; // Default activity in hours

  void _resetInputs() {
    setState(() {
      selectedGender = Gender.male;
      weight = 70;
      age = 25;
      activityHours = 2.0;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Inputs reset to default values.'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const cardColor = Color(0xFF1D1E33);
    const labelColor = Color(0xFF8D8E98);
    const accentColor = Color(0xFF00E5FF);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DAILY WATER TRACKER',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset Inputs',
            onPressed: _resetInputs,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Column(
                  children: [
                    // Gender Selection
                    Row(
                      children: [
                        Expanded(
                          child: GenderCard(
                            icon: Icons.male,
                            label: 'MALE',
                            isSelected: selectedGender == Gender.male,
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: GenderCard(
                            icon: Icons.female,
                            label: 'FEMALE',
                            isSelected: selectedGender == Gender.female,
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),

                    // Activity Hours Slider Card
                    Container(
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'DAILY ACTIVITY HOURS',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: labelColor,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                activityHours.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 42.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 6.0),
                              const Text(
                                'Hours / Day',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: labelColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: accentColor,
                              inactiveTrackColor: const Color(0xFF8D8E98).withOpacity(0.3),
                              thumbColor: accentColor,
                              overlayColor: accentColor.withOpacity(0.2),
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                              overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
                              trackHeight: 6.0,
                            ),
                            child: Slider(
                              value: activityHours,
                              min: 0.0,
                              max: 8.0,
                              divisions: 16, // 0.5 step increments
                              label: '${activityHours.toStringAsFixed(1)} h',
                              onChanged: (double newValue) {
                                setState(() {
                                  activityHours = newValue;
                                });
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('0 h (Rest)', style: TextStyle(color: labelColor, fontSize: 12.0)),
                                Text('4 h (Active)', style: TextStyle(color: labelColor, fontSize: 12.0)),
                                Text('8 h (Intense)', style: TextStyle(color: labelColor, fontSize: 12.0)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),

                    // Weight and Age Counter Cards
                    Row(
                      children: [
                        Expanded(
                          child: CounterCard(
                            label: 'WEIGHT',
                            value: weight,
                            unit: 'kg',
                            minValue: 30,
                            maxValue: 200,
                            onIncrement: () {
                              if (weight < 200) {
                                setState(() {
                                  weight++;
                                });
                              }
                            },
                            onDecrement: () {
                              if (weight > 30) {
                                setState(() {
                                  weight--;
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: CounterCard(
                            label: 'AGE',
                            value: age,
                            unit: 'yrs',
                            minValue: 10,
                            maxValue: 100,
                            onIncrement: () {
                              if (age < 100) {
                                setState(() {
                                  age++;
                                });
                              }
                            },
                            onDecrement: () {
                              if (age > 10) {
                                setState(() {
                                  age--;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Calculate Button
            BottomButton(
              buttonTitle: 'CALCULATE WATER INTAKE',
              onTap: () {
                final double litres = calculateWaterLitres(
                  weightKg: weight,
                  activityHours: activityHours,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      litres: litres,
                      weight: weight,
                      age: age,
                      activityHours: activityHours,
                      gender: selectedGender == Gender.male ? 'Male' : 'Female',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
