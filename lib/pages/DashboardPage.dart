import 'dart:convert';
import 'package:dev/pages/HistoryPage.dart';
import 'package:dev/pages/LoginPage.dart';
import 'package:dev/pages/OrdersPage.dart';
import 'package:dev/widgets/clock_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../conf.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _State();
}

class _State extends State<DashboardPage> {
  int? idPicker;
  int? pickerTotalOrder;
  Picker? picker1;
  Picker? picker2;
  Picker? picker3;
  var data;

  Future<void> getIdPicker() async {
    final response = await http.post(
      Uri.parse('${Conf.ipApi}/user/picker/username'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Conf.token}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String?>{
        'username': LoginPage.username,
      }),
    );
    var data = json.decode(response.body);
    if (kDebugMode) {
      print(response.statusCode);
    }

    if (response.statusCode == 200) {
      if (data is List && (data.isNotEmpty)) {
        var firstItem = data[0];
        setState(() {
          idPicker = firstItem['id_picker'];
        });
      }
    }
  }

  Future<void> getPickerTotalOrder() async {
    final response = await http.post(
      Uri.parse('${Conf.ipApi}/order/picker/count'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Conf.token}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, int?>{
        'id_picker': idPicker,
      }),
    );
    var data = json.decode(response.body);
    if (kDebugMode) {
      print(response.statusCode);
    }
    print('Réponse du serveur : ${response.body}');
    if (response.statusCode == 200) {
      if (data is List && (data.isNotEmpty)) {
        var firstItem = data[0];
        pickerTotalOrder = firstItem['total_order'];
      }
    }
  }

  Future<void> getPickerLeaderBoard() async {
    final response = await http
        .get(Uri.parse('${Conf.ipApi}/user/picker/leaderboard'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Conf.token}',
    });
    data = json.decode(response.body);
    if (response.statusCode == 200) {
      if (data is List && (data.isNotEmpty)) {
        picker1?.prenom = data[0]['first_name'];
        picker2?.prenom = data[1]['first_name'];
        picker3?.prenom = data[2]['first_name'];
      }
    }
  }

  switchAffichage() {
    if (data.length == 1) {
      Column(
        children: [
          firstPickerIcon(),
        ],
      );
      SizedBox(width: 60);
      Column(
        children: [
          firstPickerName(),
        ],
      );
    } else if (data.length == 2) {
      Column(
        children: [
          firstPickerIcon(),
          secondPickerIcon(),
        ],
      );
      SizedBox(width: 60);
      Column(
        children: [
          firstPickerName(),
          secondPickerName(),
        ],
      );
    } else if(data.length == 2){
      Column(
        children: [
          firstPickerIcon(),
          secondPickerIcon(),
          thirdPickerIcon(),
        ],
      );
      SizedBox(width: 60);
      Column(
        children: [
          firstPickerName(),
          secondPickerName(),
          thirdPickerName(),
        ],
      );
    }
  }

  firstPickerIcon() {
    const Icon(
      Icons.emoji_events,
      size: 50,
      color: Colors.amber,
    );
  }

  firstPickerName() {
    Text(picker1!.prenom.toString());
  }

  secondPickerIcon() {
    const Icon(
      Icons.emoji_events,
      size: 50,
      color: Colors.grey,
    );
  }

  secondPickerName() {
    Text(picker2!.prenom.toString());
  }

  thirdPickerIcon() {
    const Icon(
      Icons.emoji_events,
      size: 50,
      color: Color.fromARGB(255, 169, 113, 66),
    );
  }

  thirdPickerName() {
    Text(picker3!.prenom.toString());
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await getIdPicker();
    await getPickerTotalOrder();
    await getPickerLeaderBoard();
    setState(() {}); // Met à jour le widget après avoir récupéré les données
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClockAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, right: 30),
                height: 60,
                width: 300,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(950, 100)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const HistoryPage(),
                      ),
                    );
                  },
                  icon:
                      const Icon(Icons.history, color: Colors.white, size: 44),
                  label: const Text("Historique",
                      style: TextStyle(
                          fontSize: 40) //elevated btton background color
                      ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 125, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 500,
                      height: 240,
                      padding: const EdgeInsets.only(left: 40),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Classement",
                            style: TextStyle(fontSize: 40),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.emoji_events,
                                    size: 50,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.emoji_events,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                  Icon(
                                    Icons.emoji_events,
                                    size: 50,
                                    color: Color.fromARGB(255, 169, 113, 66),
                                  ),
                                ],
                              ),
                              SizedBox(width: 60),
                              Column(
                                children: [
                                  Text("JeanMichel",
                                      style: TextStyle(fontSize: 40)),
                                  Text("Marc", style: TextStyle(fontSize: 40)),
                                  Text("Martin",
                                      style: TextStyle(fontSize: 40)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 30),
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 500,
                  height: 240,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text("Statistique", style: TextStyle(fontSize: 40)),
                      SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "Commandes éffectués :\n       ",
                              style: TextStyle(fontSize: 40),
                            ),
                            TextSpan(
                              text: pickerTotalOrder.toString(),
                              style: const TextStyle(
                                  fontSize: 40,
                                  color: Colors.green), // Couleur différente
                            ),
                            const TextSpan(
                              text: " commandes",
                              style: TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 45, left: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(1030, 100)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => OrdersPage()));
              },
              child: const Text("Je prend mon service",
                  style: TextStyle(fontSize: 40)),
            ),
          ),
        ],
      ),
    );
  }
}
