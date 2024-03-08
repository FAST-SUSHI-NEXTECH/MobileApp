import 'package:dev/pages/dashboard_page.dart';
import 'package:dev/pages/order_detail_page.dart';
import 'package:dev/pages/login_page.dart';
import 'package:dev/widgets/custom_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  tz.initializeTimeZones(); // Initialise les données de fuseau horaire
  tz.setLocalLocation(tz.getLocation('Europe/Paris')); // Définir le fuseau horaire locals
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





