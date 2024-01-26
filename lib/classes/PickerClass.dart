import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:dev/conf.dart';

// Classe pour représenter un préparateur avec son ID, prénom et nom
class Picker {
  Future<String> fetchPickerUsername(int? idPicker) async {

    try {
      var response = await http.post(
          Uri.parse("${Conf.ipApi}/user/picker/id"),
          headers: <String, String>{
            'Authorization': 'Bearer ${Conf.ipApi}',
            'accept': 'application/json',
            'Content-Type': 'application/json'
          },
          body: jsonEncode(<String, int?>{
            'id_picker': idPicker
          })
      );

      // Convertit la réponse en objet JSON
      var data = json.decode(response.body);

      // Assurez-vous que data est une liste et prenez le premier élément
      if (data is List && (data.isNotEmpty)) {
        var firstItem = data[0];
        String username = firstItem['username']; // Accès correct à la propriété 'username'
        if (kDebugMode) {
          print(username);
        }
        return username;

      } else if (data.isEmpty){
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