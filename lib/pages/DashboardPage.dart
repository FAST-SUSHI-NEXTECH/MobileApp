import 'package:dev/pages/HistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dev/pages/LoginPage.dart';

import '../conf.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _State();
}

class _State extends State<DashboardPage> {
  Future<String> _getCurrentTime() async {
    DateTime now = DateTime.now();
    DateTime adjustedTime = now.add(const Duration(
        hours: 1)); // Utilisez toLocal pour ajuster le fuseau horaire
    String formattedTime = DateFormat.Hm()
        .format(adjustedTime); // Utilisez DateFormat pour formater l'heure
    return formattedTime;
  }

  String GetNamePicker() {
    return "${LoginPage.nom} ${LoginPage.prenom}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 100),
              padding: const EdgeInsets.only(right: 0),
              child: Text(
                "FastSushi",
                style: TextStyle(fontFamily: Conf.police, fontSize: 30),
              ),
            ),
            Image.asset(
              "assets/images/logo_blanc.png",
              width: 100,
            ),
          ],
        ),
        backgroundColor: const Color(0xFF000000),
        toolbarHeight: 110,
        actions: [
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 15),
            child: FutureBuilder(
              future: _getCurrentTime(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.data.toString(),
                        style: const TextStyle(fontSize: 30)),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, right: 50),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
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
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 50, left: 50),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  GetNamePicker(),
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 150, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 500,
                      height: 240,
                      padding: const EdgeInsets.only(left: 50),
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
                    const SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(top: 45),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(950, 100)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        onPressed: () {
                          // Ajouter la logique du bouton ici
                        },
                        child: const Text("Je prend mon service",
                            style: TextStyle(fontSize: 40)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
