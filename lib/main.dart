import 'package:dev/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


void main() {
  tz.initializeTimeZones(); // Initialise les données de fuseau horaire
  tz.setLocalLocation(tz.getLocation('Europe/Paris')); // Définir le fuseau horaire local
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}





