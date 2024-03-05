import 'package:flutter/material.dart';
import '../classes/OrderClass.dart';
import '../classes/PickerClass.dart';
import '../conf.dart';
import '../pages/LoginPage.dart';
import '../pages/detail_order_page.dart';

class OrderDetailButton extends StatelessWidget {
  final int? orderState;
  final Order order;

  const OrderDetailButton({
    super.key,
    this.orderState,
    required this.order,
  });

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
          style: TextStyle(
              fontFamily: Conf.police,
              fontSize: 17
          ),
        ),
        icon: Icon(_getButtonIcon(orderState)),
      ),
    );
  }

  Color _getButtonColor(int? state) {
    switch (state) {
      case 1 || 2:
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  Future<void> Function()? _getButtonOnPressed(BuildContext context, int? state) {
    return () async {
      if (state == 1 || state == 2) {
        try {
          // Récupération de l'ID de manière asynchrone
          final int? currentPickerId = await Pickers().fetchPickerId('${LoginPage.username}');
          // Navigation vers DetailOrderPage avec l'ID récupéré
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailOrderPage(orderId: order.idOrder, pickerId: order.idPicker, currentPickerId: currentPickerId, date: order.time)
            ),
          );
        } catch (e) {
          print("Erreur lors de la récupération du Picker ID: $e");
        }
      }
    };
  }

  String _getButtonLabel(int? state) {
    switch (state) {
      case 1 || 2:
        return "Détail";
      default:
        return "ERREUR";
    }
  }

  IconData _getButtonIcon(int? state) {
    switch (state) {
      case 1 || 2:
        return Icons.list;
      default:
        return Icons.warning;
    }
  }
}