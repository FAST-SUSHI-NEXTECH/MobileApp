import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:dev/conf.dart';

class Orders {
  Future<List<int?>> fetchIdOrders() async {
    try {
      final response = await http.get(Uri.parse("$ipApi/order"));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Réponse: ${response.body}');
        }
        List<dynamic> ordersList = json.decode(response.body);
        List<int?> idOrders = [];

        for (var order in ordersList) {
          if (order['id_order'] != null) {
            int idOrder = int.parse(order['id_order'].toString());
            idOrders.add(idOrder);
          } else {
            idOrders.add(null);
          }
        }
        return idOrders;
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
