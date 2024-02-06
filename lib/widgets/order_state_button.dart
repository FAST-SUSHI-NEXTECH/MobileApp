import 'package:dev/pages/LoginPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../classes/OrderClass.dart';
import '../classes/PickerClass.dart';

class OrderStateButton extends StatelessWidget {
  final int? orderState;
  final Order order;
  final Function(int?, int?) onUpdateOrderState;
  final Function(int?, int?) onUpdateOrderPicker;

  const OrderStateButton({
    Key? key,
    this.orderState,
    required this.order,
    required this.onUpdateOrderState,
    required this.onUpdateOrderPicker
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                _getButtonColor(orderState)
            )
        ),
        onPressed: _getButtonOnPressed(context, orderState),
        label: Text(_getButtonLabel(orderState),
          style: const TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 17
          ),
        ),
        icon: Icon(_getButtonIcon(orderState)),
      ),
    );
  }

  Color _getButtonColor(int? state) {
    switch (state) {
      case 1:
        return Colors.blue;
      case 2:
        return Colors.black12;
      case 3:
        return Colors.blue;
      default:
        return Colors.red;
    }
  }

  Future<void> Function()? _getButtonOnPressed(BuildContext context, int? state) {
    switch (state) {
      case 1:
        return () async {
          int? idPicker = await Pickers().fetchPickerId('${LoginPage.username}');
          if (kDebugMode) {
            print(idPicker);
          }
          await onUpdateOrderPicker(idPicker, order.idOrder);
          // Met à jour l'état de la commande à 2 (En cours de préparation)
          await onUpdateOrderState(2, order.idOrder);
        };
      case 2:
        return null;
      case 3:
        return () async {
          // Met à jour l'état de la commande à 1 (Prendre en charge la commande)
          await onUpdateOrderState(1, order.idOrder);
        };
      default:
        return null;
    }
  }

  String _getButtonLabel(int? state) {
    switch (state) {
      case 1:
        return "Prendre en charge la commande";
      case 2:
        return "En cours de préparation";
      case 3:
        return "Revenir sur la commande";
      default:
        return "ERREUR";
    }
  }

  IconData _getButtonIcon(int? state) {
    switch (state) {
      case 1:
        return Icons.touch_app;
      case 2:
        return Icons.hourglass_bottom;
      case 3:
        return Icons.restore;
      default:
        return Icons.warning;
    }
  }
}