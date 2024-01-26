import 'package:flutter/material.dart';
import '../classes/OrderClass.dart';
import '../pages/DetailOrderPage.dart';

class OrderDetailButton extends StatelessWidget {
  final int? orderState;
  final Order order;
  final Function(int?, int?) onUpdateOrderState;

  const OrderDetailButton({
    Key? key,
    this.orderState,
    required this.order,
    required this.onUpdateOrderState
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
      case 1 || 2:
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  Future<void> Function()? _getButtonOnPressed(BuildContext context, int? state) {
    switch (state) {
      case 1 || 2:
        return
          () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailOrderPage(orderId: order.idOrder)
              ),
            );
          };
      default:
        return null;
    }
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