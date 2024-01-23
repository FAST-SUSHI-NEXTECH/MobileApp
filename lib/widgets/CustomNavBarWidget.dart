import 'package:flutter/material.dart';

import '../pages/CommandsPage.dart';

class CustomNavBarWidget extends StatefulWidget {
  const CustomNavBarWidget({Key? key}) : super(key: key);

  @override
  _CustomNavBarWidgetState createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget> {

  void BackListCommand(){
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
            const CommandsPage()));

  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo à gauche
          Image.asset(
            "assets/images/logo_blanc.png",
            width: 100,
            height: 70,
          ),

          // Espace entre le logo et les boutons
          SizedBox(width: 450),

          // Boutons au centre gauche
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.list, color: Colors.white, size: 70),
                onPressed: () {BackListCommand();},
                padding: EdgeInsets.only(bottom: 40),
              ),
              SizedBox(width: 40),
              IconButton(
                icon: const Icon(Icons.history, color: Colors.white, size: 70),
                onPressed: () {},
                padding: EdgeInsets.only(bottom: 40),
              ),
            ],
          ),

          // Espace entre les boutons et le bouton de déconnexion
          SizedBox(width: 500),

          // Bouton de déconnexion à droite
          Align(
            // Légèrement décalé vers le haut
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.white, size: 70),
              onPressed: () {},
              padding: EdgeInsets.only(bottom: 30,right: 40),
            ),
          ),
          // Add spacing between the button and the edge of the bar
        ],
      ),
    );
  }
}
