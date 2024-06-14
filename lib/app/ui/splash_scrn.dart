import 'package:flutter/material.dart';
import 'package:sumangalam/core/styles/app_icon.dart';

class AppSplashScrn extends StatelessWidget {
  const AppSplashScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0 * 2),
            AppIcons.appLogo.toWidget(),
            const SizedBox(height: 16.0 * 2),
            const Text(
              "Poweredby",
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
