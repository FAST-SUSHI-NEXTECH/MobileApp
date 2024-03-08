import 'package:flutter/material.dart';
import '../conf.dart';

class OrderStateContainer extends StatelessWidget {
  final int? orderState;

  const OrderStateContainer({super.key, this.orderState});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 35,
      color: _getContainerColor(orderState),
      child: Center(
        child: Text(
          _getContainerLabel(orderState),
          style: TextStyle(
            fontFamily: Conf.police,
            color: Colors.black54,
            fontSize: 18
          ),
        ),
      ),
    );
  }

    Color _getContainerColor(int? state) {
      switch (state) {
        case 1:
          return Colors.blue.shade200;
        case 2:
          return Colors.black12;
        case 3:
          return Colors.green.shade200;
        default:
          return Colors.red;
      }
    }

  String _getContainerLabel(int? state) {
    switch (state) {
      case 1:
        return "En attente";
      case 2:
        return "En cours";
      case 3:
        return "Récupérer";
      default:
        return "ERREUR";
    }
  }
}