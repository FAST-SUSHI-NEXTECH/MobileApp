import 'package:flutter/material.dart';
import 'package:dev/conf.dart';
import 'package:dev/classes/order_class.dart';
import '../classes/picker_class.dart';

class OrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Order order;

  const OrderAppBar({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    Orders ordersClass = Orders();

    return AppBar(
        automaticallyImplyLeading: false, // Supprime le bouton pour revenir en arrière
        backgroundColor: const Color(0xFF000000),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Flexible(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 50),
                    child: FutureBuilder<String>(
                      future: Pickers().fetchPickerUsername(order.idPicker),
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Erreur", style: TextStyle(fontFamily: Conf.police, fontSize: 25));
                        } else {
                          return Text('${snapshot.data}', style: TextStyle(fontFamily: Conf.police, fontSize: 25));
                        }
                      }
                    )
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 50),
                      child: Text('N°${order.idOrder}', style: TextStyle(fontFamily: Conf.police, fontSize: 25),)
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 50),
                      child: Text(order.time ?? 'Temps inconnu', style: TextStyle(fontFamily: Conf.police, fontSize: 25),)
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 50),
                      child: FutureBuilder<double>(
                        future: ordersClass.fetchOrderPrice(order.idOrder), // Appelle la fonction fetchOrderPrice
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text("Erreur", style: TextStyle(fontFamily: Conf.police, fontSize: 25)); // Gestion des erreurs
                          } else {
                            // Affiche le prix si la donnée est disponible
                            return Text('${snapshot.data?.toStringAsFixed(2)} €', style: TextStyle(fontFamily: Conf.police, fontSize: 25));
                          }
                        },
                      )
                  )
              )
            ]
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
