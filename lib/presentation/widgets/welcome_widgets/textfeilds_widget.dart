import 'package:flutter/material.dart';

Widget textFieldWidget(
  String label,
  IconData icon,
  TextEditingController controll,
  TextInputType type,
) {
  return TextFormField(
    controller: controll,
    keyboardType: type,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return '$label is required';
      }
      if (type == TextInputType.number) {
        if (double.tryParse(value) == null || int.tryParse(value) == null) {
          return 'enter a valid number';
        }
      }

      if (type == TextInputType.text || type == TextInputType.name) {
        if (RegExp(r'^[0-9]+$').hasMatch(value)) {
          return 'Please enter a valid name';
        }
      }
      return null;
    },
    decoration: InputDecoration(
      prefixIcon: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 253, 243, 236),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.deepOrange, size: 18),
      ),

      fillColor: Colors.white,
      labelText: label,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrange, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
