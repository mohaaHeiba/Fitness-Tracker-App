import 'package:flutter/material.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
  colors: [
              Color(0xFFFFF8F3),
              Color(0xFFFFDBAC),
              Color(0xFFFFDBAC),
            ],            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(child: Text('HI')),
      ),
    );
  }
}
