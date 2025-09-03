import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية تغطي الشاشة كلها
          Positioned.fill(
            child: Image.asset("assets/images/logo.jpeg", fit: BoxFit.cover),
          ),

          // Column يغطي الشاشة كاملة
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // النص في الأعلى
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Text(
                    "Hello",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // الزرار في الأسفل
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("ابدأ الآن"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
