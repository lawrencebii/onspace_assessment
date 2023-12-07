import 'package:flutter/material.dart';
import 'package:onspace_assessment/features/location/views/location_page.dart';
import 'package:onspace_assessment/features/navigation/navigation.dart';
import 'package:onspace_assessment/features/navigation/state_class.dart';

void main() {
  runApp(StateManagementClass(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Locator App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Navigation());
  }
}
