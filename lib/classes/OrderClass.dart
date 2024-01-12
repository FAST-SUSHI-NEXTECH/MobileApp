import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:dev/conf.dart';

// Classe pour représenter une commande avec son ID et l'heure
class Order {
  final int? idOrder;
  final String? time;
  final int? idPicker;
  final int? orderState;

  Order({this.idOrder, this.time, this.idPicker, this.orderState});
}

class Orders {
  Future<List<Order>> fetchOrders() async {
    try {
      final response = await http.get(Uri.parse("$ipApi/order"));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Réponse: ${response.body}');
        }

        List<dynamic> ordersList = json.decode(response.body);
        List<Order> orders = [];

        for (var order in ordersList) {
          if (order['order_state'] != 3) {
            int? idOrder;
            if (order['id_order'] != null) {
              idOrder = int.parse(order['id_order'].toString());
            } else {
              idOrder = null;
            }

            String? time;
            if (order['date'] != null) {
              String dateTime = order['date'];
              DateTime parsedDateTime = DateTime.parse(dateTime).toLocal();
              time = "${parsedDateTime.hour.toString().padLeft(
                  2, '0')}:${parsedDateTime.minute.toString().padLeft(2, '0')}";
              // Formate l'heure au format "HH:mm"
            }

            int? idPicker;
            if (order['id_picker'] != null) {
              idPicker = int.parse(order['id_picker'].toString());
            } else {
              idPicker = null;
            }

            int? orderState;
            if (order['order_state'] != null) {
              orderState = int.parse(order['order_state'].toString());
            } else {
              orderState = null;
            }

            orders.add(Order(idOrder: idOrder,
                time: time,
                idPicker: idPicker,
                orderState: orderState));
          }
        }
        return orders;
      } else {
        if (kDebugMode) {
          print('Erreur: ${response.statusCode}');
        }
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
      return [];
    }
  }


        }
        return orders;
      } else {
        if (kDebugMode) {
          print('Erreur: ${response.statusCode}');
        }
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
      return [];
    }
  }
}
