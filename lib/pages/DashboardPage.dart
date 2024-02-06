import 'package:dev/pages/HistoryPage.dart';
import 'package:dev/pages/OrdersPage.dart';
import 'package:dev/widgets/clock_appbar.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClockAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 60,
                width: 600,
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
                  icon: const Icon(Icons.history, color: Colors.white, size: 44),
                  label: const Text("Historique de commandes", style: TextStyle(fontSize: 40)//elevated btton background color
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
                                  Text("Marc",
                                      style: TextStyle(fontSize: 40)),
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
                  child: const Column(
                    children: [
                      SizedBox(height: 10),
                      Text("Statistique", style: TextStyle(fontSize: 40)),
                      SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Commandes éffectués :\n       ",
                              style: TextStyle(fontSize: 40),
                            ),
                            TextSpan(
                              text: "35",
                              style: TextStyle(fontSize: 40, color: Colors.green), // Couleur différente
                            ),
                            TextSpan(
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
            margin: EdgeInsets.only(top: 45),
            child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(1000, 100)),
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
