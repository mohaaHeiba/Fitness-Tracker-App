import 'dart:ui';

import 'package:flutter/material.dart';

class BmiWidget {
  double _calculateBMI(dynamic user) {
    return user.weight / ((user.height / 100) * (user.height / 100));
  }

  String _getBMICategory(dynamic user) {
    final bmi = _calculateBMI(user);
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Overweight";
    return "Obese";
  }

  Color _getBMIColor(dynamic user) {
    final bmi = _calculateBMI(user);
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  Widget bmiWidget(final user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      decoration: BoxDecoration(
        color: _getBMIColor(user).withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: BoxBorder.all(color: _getBMIColor(user), width: 1),
      ),
      child: Text(
        'BMI:${_calculateBMI(user).toStringAsFixed(1)} - ${_getBMICategory(user)}',
        style: TextStyle(
          color: _getBMIColor(user),
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
