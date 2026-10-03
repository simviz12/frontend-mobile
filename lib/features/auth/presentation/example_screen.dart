import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Design System Validation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'This is a card to validate the theme configuration with 16px radius.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Primary Button'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.alert),
              child: const Text('Danger Button'),
            ),
          ],
        ),
      ),
    );
  }
}
