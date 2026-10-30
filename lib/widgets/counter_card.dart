import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String label;
  final int value;
  final String unit;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int minValue;
  final int maxValue;

  const CounterCard({
    super.key,
    required this.label,
    required this.value,
    this.unit = '',
    required this.onIncrement,
    required this.onDecrement,
    this.minValue = 1,
    this.maxValue = 300,
  });

  @override
  Widget build(BuildContext context) {
    const cardColor = Color(0xFF1D1E33);
    const labelColor = Color(0xFF8D8E98);

    final bool canDecrement = value > minValue;
    final bool canIncrement = value < maxValue;

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: labelColor,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '$value',
                style: const TextStyle(
                  fontSize: 42.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 4.0),
                Text(
                  unit,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: labelColor,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _RoundIconButton(
                icon: Icons.remove,
                onPressed: canDecrement ? onDecrement : null,
              ),
              const SizedBox(width: 12.0),
              _RoundIconButton(
                icon: Icons.add,
                onPressed: canIncrement ? onIncrement : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _RoundIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return RawMaterialButton(
      elevation: 2.0,
      constraints: const BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
      shape: const CircleBorder(),
      fillColor: isDisabled ? const Color(0xFF111328) : const Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: isDisabled ? Colors.white24 : Colors.white,
        size: 24.0,
      ),
    );
  }
}
