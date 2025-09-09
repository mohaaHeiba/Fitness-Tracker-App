import 'package:flutter/material.dart';

Widget buildStateCard(IconData icon, String label, final value) {
  final textSpan = label == 'weight' ? 'kg' : 'cm';
  final colorIcon = label == 'weight' ? Colors.blueAccent : Colors.greenAccent;

  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorIcon.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon, color: colorIcon),
              ),
            ),
            SizedBox(height: 10),
            Text(label, style: TextStyle(color: Colors.black.withOpacity(0.7))),

            SizedBox(height: 5),

            RichText(
              text: TextSpan(
                text: value.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D2D2D),
                ),
                children: [
                  TextSpan(
                    text: " $textSpan",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}
