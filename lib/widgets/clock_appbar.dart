import 'dart:async';
import 'package:flutter/material.dart';
import '../conf.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:dev/pages/LoginPage.dart';

class ClockAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // Définit la taille préférée de l'appBar

  const ClockAppBar({Key? key})
      : preferredSize = const Size.fromHeight(125.0),
        super(key: key);

  @override
  ClockAppBarState createState() => ClockAppBarState(); // Rendre cette ligne publique
}

class ClockAppBarState extends State<ClockAppBar> {
  late String _formattedTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _formattedTime = _formatDateTime(tz.TZDateTime.now(tz.local));
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _formattedTime = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
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
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 50),
              child: Text("${LoginPage.username}", style: TextStyle(fontFamily: Conf.police, fontSize: 25),)
            )
          ),
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
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 50),
              child: Text(
                _formattedTime,
                style: const TextStyle(fontSize: 30),
              )
            )
          )
        ]
      )
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
