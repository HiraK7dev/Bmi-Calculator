import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String developerName = 'Hirakjyoti Bhattacharjya';
  final String contactEmail = 'hirak.bhatta2004@gmail.com';

  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to the BMI Calculator app, brought to you by:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Developer: $developerName',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ),
            const SizedBox(height: 16),
            const Text(
              'About the Developer:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                'Hey there! I am Hirak, the developer behind this BMI Calculator app. I am just a mobile app enthusiast who enjoys tinkering with Flutter.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Why BMI?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'I created this app to make something simple and helpful. BMI felt like the right starting point, a small tool to keep tabs on your health.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Contact Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
           Card(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 4.0,
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Feel free to reach out with any questions, feedback, or suggestions. Your input is valuable in improving the app and providing the best user experience.',
                style: TextStyle(fontSize: 16),
              ),
            ),
           ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Contact: $contactEmail',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ),
          ],
        ),
    );
  }
}