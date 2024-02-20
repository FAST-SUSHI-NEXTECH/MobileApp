import 'package:flutter/material.dart';
import 'package:dev/conf.dart';
import 'package:dev/classes/OrderClass.dart'; // Remplacez par le chemin correct vers votre fichier OrderClass.dart

class OrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Order order;

  const OrderAppBar({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
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
                      child: Text('${order.orderContentPlate}', style: TextStyle(fontFamily: Conf.police, fontSize: 25),)
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 50),
                      child: Text('${order.orderContentAppetizer}', style: TextStyle(fontFamily: Conf.police, fontSize: 25),)
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 50),
                      child: Text('${order.orderContentDessert}', style: TextStyle(fontFamily: Conf.police, fontSize: 25),)
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 50),
                      child: Text('Appetizer: ${order.orderContentAppetizer}\n', style: TextStyle(fontFamily: Conf.police, fontSize: 25),)
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 50),
                      child: Text('Appetizer: ${order.orderContentAppetizer}\n', style: TextStyle(fontFamily: Conf.police, fontSize: 25),)
                  )
              )
            ]
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
