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
  final int? idProduct;
  final String? orderContentAppetizer;
  final String? orderContentPlate;
  final String? orderContentDessert;
  final int? quantity;

  Order({this.idOrder, this.time, this.idPicker, this.orderState, this.idProduct,this.orderContentAppetizer, this.orderContentPlate, this.orderContentDessert, this.quantity});
}

class Orders {
  Future<List<Order>> fetchOrders(String currentOrderState) async {
    try {
      final response = await http.get(
        Uri.parse("${Conf.ipApi}/order/all"),
        headers: {
          'Authorization': 'Bearer ${Conf.token}',
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

  Future<void> updateOrderState(int? orderState, int? orderId) async {
    final url = Uri.parse("${Conf.ipApi}/order/state/update");

    Map<String, dynamic> body = {
      'order_state': orderState,
      'id_order': orderId
    };

    await http.put(
      url,
      headers: {
        'Authorization': 'Bearer ${Conf.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: json.encode(body),
    );
  }

  Future<void> updateOrderPicker(int? pickerId, int? orderId) async {
    final url = Uri.parse("${Conf.ipApi}/order/picker/update");

    Map<String, dynamic> body = {
      'id_picker': pickerId,
      'id_order': orderId
    };

    await http.put(
      url,
      headers: {
        'Authorization': 'Bearer ${Conf.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: json.encode(body),
    );
  }

  Future<List<Order>> fetchOrdersContent(int? idOrder) async {

    List<Order> ordersProduct = [];

    try {
      var response = await http.post(
          Uri.parse("${Conf.ipApi}/order/details"),
          headers: <String, String>{
            'accept': 'application/json',
            'Authorization': 'Bearer ${Conf.token}',
            'Content-Type': 'application/json'
          },
          body: jsonEncode(<String, int?>{
            'id_order': idOrder
          })
      );

      // Convertit la réponse en objet JSON
      var data = json.decode(response.body);

      // Assurez-vous que data est une liste et prenez le premier élément
      if (data is List && data.isNotEmpty) {
        // Itérer sur chaque objet dans la liste
        for (var item in data) {
          if (item['type_product'] == 'appetizer'){
            ordersProduct.add(Order(
                idProduct: item['id_product'],
                orderContentAppetizer: item['product_name'],
                quantity: item['quantity']
            ));

          } else if (item['type_product'] == 'plate') {
            ordersProduct.add(Order(
                idProduct: item['id_product'],
                orderContentPlate: item['product_name'],
                quantity: item['quantity']
            ));


          } else if (item['type_product'] == 'dessert') {
            ordersProduct.add(Order(
                idProduct: item['id_product'],
                orderContentDessert: item['product_name'],
                quantity: item['quantity']
            ));

          } else if (kDebugMode) {
            print('erreur de produit (mauvais type de produit)');
          }
        }
      }

      if (kDebugMode) {
        print(ordersProduct);
      }

      return ordersProduct;

    } catch (e) {
      if (kDebugMode) {print('Exception: $e');
      } return [];
    }
  }

  Future<double> fetchOrderPrice(int? idOrder) async {

    try {
      var response = await http.post(
          Uri.parse("${Conf.ipApi}/order/total/id"),
          headers: <String, String>{
            'accept': 'application/json',
            'Authorization': 'Bearer ${Conf.token}',
            'Content-Type': 'application/json'
          },
          body: jsonEncode(<String, int?>{
            'id_order': idOrder
          })
      );

      // Convertit la réponse en objet JSON
      var data = json.decode(response.body);
      double orderPrice = data[0]["TOTAL_ORDER"];

      return orderPrice;

    } catch (e) {
      if (kDebugMode) {print('Exception: $e');
      } return 0;
    }
  }
}