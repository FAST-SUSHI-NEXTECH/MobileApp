import 'package:flutter/material.dart';

class DetailOrderPage extends StatelessWidget {
  final int? orderId;

  const DetailOrderPage({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la Commande - ID: $orderId'),
      ),
      body: Center(
        child: Text('Affichage des détails pour la commande ID: $orderId'),
      ),
    );
  }
}

