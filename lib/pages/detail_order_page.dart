import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../classes/OrderClass.dart';
import '../conf.dart';
import '../widgets/order_detail_appbar.dart';
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
        appBar: OrderAppBar(
            order: Order(
              idOrder: 123,
              orderContentAppetizer: 'Salade',
              orderContentPlate: 'Steak',
              orderContentDessert: 'Tiramisu',
            )
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