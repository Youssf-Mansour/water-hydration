# Daily Water & Hydration Tracker App

A modern, responsive Flutter application built with Dart that calculates daily recommended water intake based on user weight, activity level, age, and gender.

---

## 🌟 Features

- **Dark Theme UI**: Custom dark color palette (`#0A0E21`, `#1D1E33`, `#00E5FF`) built using Flutter Material Design.
- **Gender Selection (`GenderCard`)**: Interactive selection cards for Male/Female with visual state highlights.
- **Activity Hours Slider**: Custom `SliderTheme` for adjusting physical activity level (0 to 8 hours/day).
- **Interactive Counters (`CounterCard`)**: Weight (kg) and Age (yrs) inputs with `+` / `-` buttons and value bounds checking (prevents invalid numbers).
- **Water Intake Calculation (`water_calculator.dart`)**:
  - Base need: `weight (kg) * 35 ml`
  - Extra activity: `activity (hours) * 250 ml`
  - Total litres = `(baseMl + activityMl) / 1000`
- **Result Screen (`ResultScreen`)**:
  - Recommended daily intake displayed in Litres (`L / Day`).
  - Circular water gauge progress visual & water drop icon.
  - Equivalent standard glasses count (~250 ml per glass).
  - Personal input summary chips (Weight, Activity, Gender, Age).
  - Personalized hydration advice.
  - **Re-calculate** button returning to the input screen (`Navigator.pop`).
- **Reset Inputs Action**: Quick reset button in the App Bar to restore default input values.
- **Overflow Prevention**: Wrapped main content inside `SingleChildScrollView`, `SafeArea`, `Expanded`, and `Flexible` to ensure responsive rendering across various screen sizes.

---

## 📐 Calculation Logic & Example Verification

The daily fluid requirement calculation formula implemented in `lib/utils/water_calculator.dart`:

$$\text{baseMl} = \text{weightKg} \times 35$$
$$\text{activityMl} = \text{activityHours} \times 250$$
$$\text{totalMl} = \text{baseMl} + \text{activityMl}$$
$$\text{litres} = \frac{\text{totalMl}}{1000}$$

### Verification Table:
| Weight (kg) | Activity (h) | Calculation | Total (L/Day) |
| :---: | :---: | :---: | :---: |
| **50** | **0** | $1750 + 0 = 1750 \text{ ml}$ | **1.75 L** |
| **60** | **8** | $2100 + 2000 = 4100 \text{ ml}$ | **4.10 L** |
| **70** | **2** | $2450 + 500 = 2950 \text{ ml}$ | **2.95 L** |
| **90** | **4** | $3150 + 1000 = 4150 \text{ ml}$ | **4.15 L** |

---

## 📁 Project Architecture

```
lib/
├── main.dart                   # Entry point and Dark Theme configuration
├── screens/
│   ├── input_screen.dart       # Primary input screen (StatefulWidget)
│   └── result_screen.dart      # Results display screen (StatelessWidget)
├── widgets/
│   ├── gender_card.dart        # Reusable gender selection card
│   ├── counter_card.dart       # Reusable + / - counter card
│   └── bottom_button.dart      # Full-width action button
└── utils/
    └── water_calculator.dart   # Water calculation logic & advice helpers
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.13 or higher)
- [Dart SDK](https://dart.dev/get-dart)

### Installation & Execution

1. **Clone or open project directory**:
   ```bash
   cd assignment
   ```

2. **Get Flutter dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run application**:
   ```bash
   flutter run
   ```

4. **Run Unit & Widget Tests**:
   ```bash
   flutter test
   ```

---

## ✅ Submission Checklist

- [x] Application compiles without errors (`flutter run`).
- [x] Input Screen contains Gender cards, Activity Slider, Weight counter, Age counter, and Calculate button.
- [x] Selection state changes via `setState()`.
- [x] Calculation logic implemented strictly as specified in `water_calculator.dart`.
- [x] Navigation to `ResultScreen` via `Navigator.push()` passing calculated data.
- [x] `ResultScreen` displays intake in Litres, glasses count, summary, and advice.
- [x] **Re-calculate** button returns to `InputScreen` using `Navigator.pop()`.
- [x] Dark Theme styling applied cleanly.
- [x] Responsive layout with `SingleChildScrollView` prevents `RenderFlex` overflow errors.
- [x] Unit & Widget tests pass (`flutter test`).
