import 'package:flutter/material.dart';

class CommandsPage extends StatefulWidget {
  const CommandsPage({Key? key}) : super(key: key);

  @override
  State<CommandsPage> createState() => _CommandsPageState();
}

final List<String> items = [
  'Élément 1',
  'Élément 2',
  'Élément 3',
  'Élément 4',
  'Élément 5',
  'Élément 6',
  'Élément 7',
  'Élément 8',
  'Élément 9',
  'Élément 10',
];

class _CommandsPageState extends State<CommandsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Commands Page"),
        ),

        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
              // Vous pouvez personnaliser chaque élément de la liste ici.
              // Par exemple, ajouter des icônes, des images, etc.
            );
          },
        ),
      )
    );
  }
}