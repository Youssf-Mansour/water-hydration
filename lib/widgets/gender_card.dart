import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const activeCardColor = Color(0xFF1D1E33);
    const inactiveCardColor = Color(0xFF111328);
    const activeAccentColor = Color(0xFF00E5FF);
    const inactiveContentColor = Color(0xFF8D8E98);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? activeCardColor : inactiveCardColor,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: isSelected ? activeAccentColor : Colors.transparent,
            width: 2.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: activeAccentColor.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70.0,
              color: isSelected ? activeAccentColor : inactiveContentColor,
            ),
            const SizedBox(height: 12.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: isSelected ? Colors.white : inactiveContentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
