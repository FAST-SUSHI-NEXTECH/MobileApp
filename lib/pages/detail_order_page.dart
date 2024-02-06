import 'package:flutter/material.dart';
import 'package:dev/widgets/clock_appbar.dart';

class DetailOrderPage extends StatelessWidget {
  final int? orderId;

  const DetailOrderPage({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClockAppBar(),
      body: Center(
        child: Text('Affichage des détails pour la commande ID: $orderId'),
      ),
    );
  }
}

