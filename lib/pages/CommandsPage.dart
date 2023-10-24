import 'package:flutter/material.dart';

class CommandsPage extends StatefulWidget {
  const CommandsPage({Key? key}) : super(key: key);

  @override
  State<CommandsPage> createState() => _CommandsPageState();
}

class _CommandsPageState extends State<CommandsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Commands Page"),
        ),
      )
    );
  }
}