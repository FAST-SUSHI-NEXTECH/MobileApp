import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dev/widgets/clock_appbar.dart';
import '../classes/OrderClass.dart';
import '../conf.dart';
import '../pages/OrdersPage.dart';

void main() {
  runApp(const MaterialApp(
    home: DetailOrderPage(),
  ));
}

class DetailOrderPage extends StatefulWidget {
  final int? orderId;
  const DetailOrderPage({super.key, this.orderId});

  @override
  State<StatefulWidget> createState() {
    return _DetailOrderPageState();
  }
}

class _DetailOrderPageState extends State<DetailOrderPage> {

  const DetailOrderPage({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClockAppBar(),
      body: Center(
        child: Text('Affichage des détails pour la commande ID: $orderId'),
      ),
        body: Column(
            mainAxisSize: MainAxisSize.min, // Utilisez MainAxisSize.min pour que la colonne prenne juste l'espace nécessaire.
            children: [
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Affichez vos listes ici en utilisant le même modèle pour appetizers, plates, et desserts
                  Flexible(
                      flex: 1, // 13% de l'espace
                      child: Container(
                          height: 550,
                          alignment: Alignment.center,
                          child: const VerticalDivider(thickness: 3, color: Colors.black54))),
                  Flexible(
                      flex: 1, // 13% de l'espace
                      child: Container(
                          height: 550,
                          alignment: Alignment.center,
                          child: const VerticalDivider(thickness: 3, color: Colors.black54))),
                ],
              )
            ),
    );
  }

}