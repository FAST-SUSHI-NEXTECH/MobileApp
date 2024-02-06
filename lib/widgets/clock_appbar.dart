import 'dart:async';
import 'package:flutter/material.dart';
import '../conf.dart';

class ClockAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // Définit la taille préférée de l'appBar

  const ClockAppBar({Key? key})
      : preferredSize = const Size.fromHeight(125.0),
        super(key: key);

  @override
  ClockAppBarState createState() => ClockAppBarState(); // Rendre cette ligne publique
}

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Supprime le bouton pour revenir en arrière
      backgroundColor: const Color(0xFF000000),
      toolbarHeight: widget.preferredSize.height,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FastSushi",
                  style: TextStyle(fontFamily: Conf.police, fontSize: 30),
                ),
                Image.asset(
                  "assets/images/logo_blanc.png",
                  width: 100,
                )
              ]
            )
          ),
        ]
      )
    );
  }
}
