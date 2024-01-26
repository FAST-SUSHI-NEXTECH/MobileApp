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
  final String? orderContent;

  Order({this.idOrder, this.time, this.idPicker, this.orderState, this.orderContent});
}

class Orders {
  Future<List<Order>> fetchOrders(String currentOrderState) async {
    try {
      final response = await http.get(
        Uri.parse("$ipApi/order"),
        headers: {
          'Authorization': 'Bearer $tokenApi',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Réponse: ${response.body}');
        }

        List<dynamic> ordersList = json.decode(response.body);
        List<Order> orders = [];

        for (var order in ordersList) {
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

            if (currentOrderState == "new" && (orderState == 1 || orderState == 2)) {
              orders.add(Order(idOrder: idOrder,
                  time: time,
                  idPicker: idPicker,
                  orderState: orderState));
            } else if (currentOrderState == "old" && orderState == 3) {
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

  Future<http.Response> updateOrderState(int? orderState, int? orderId) async {
    final url = Uri.parse("$ipApi/order/state/update");

    Map<String, dynamic> body = {
      'order_state': orderState,
      'id_order': orderId
    };

    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $tokenApi',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> updateOrderPicker(int? pickerId, int? orderId) async {
    final url = Uri.parse("$ipApi/order/picker/update");

    Map<String, dynamic> body = {
      'id_picker': pickerId,
      'id_order': orderId
    };

    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $tokenApi',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<String> fetchOrdersContent(int? idOrder) async {
    try {
      var response = await http.post(
          Uri.parse("$ipApi/order/details"),
          headers: <String, String>{
            'accept': 'application/json',
            'Authorization': 'Bearer $tokenApi',
            'Content-Type': 'application/json'
          },
          body: jsonEncode(<String, int?>{
            'id_order': idOrder
          })
      );

      // Convertit la réponse en objet JSON
      var data = json.decode(response.body);

      String formatString(String originalString) {
        if (originalString.length > 50) {
          return '${originalString.substring(0, 45)}...';
        } else {
          return originalString;
        }
      }

      // Assurez-vous que data est une liste et prenez le premier élément
      if (data is List && data.isNotEmpty) {
        // Initialiser une chaîne pour stocker tous les noms de produits
        String allProducts = '';

        // Itérer sur chaque objet dans la liste
        for (var item in data) {
          // Ajouter le nom du produit à la chaîne, suivi d'une virgule et d'un espace
          allProducts += '${item['product_name']}, ';
        }

        allProducts = formatString(allProducts.substring(0, allProducts.length - 2));

        if (kDebugMode) {
          print(allProducts);
        }
        return allProducts;

      } else if (data.isEmpty) {
        return '';

      } else {
        if (kDebugMode) {
          print('Erreur: ${response.statusCode}');
        }
        return  'Erreur : Impossible de récupérer la commande';
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erreur: $e');
      }
      return  'Erreur : Exception lors de la requête';
    }
  }
}
