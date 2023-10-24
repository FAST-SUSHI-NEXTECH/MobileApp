import 'package:flutter/material.dart';

class CommandsPage extends StatefulWidget {
  const CommandsPage({Key? key}) : super(key: key);

  @override
  State<CommandsPage> createState() => _CommandsPageState();
}

class _CommandsPageState extends State<CommandsPage> {
  List<bool> isExpanded = List.generate(10, (index) => false);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Commands Page"),
        ),

        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded[index] = !isExpanded[index];
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isExpanded[index] ? 100.0 : 50.0, // Hauteur agrandie ou normale
                color: Colors.blue, // Couleur de fond
                child: Center(
                  child: Row(
                    children: [
// Première colonne
                      Text('Colonne 1: '),
                      Text('Élément $index'), // Contenu de la première colonne

// Espace entre les colonnes
                      SizedBox(width: 10),

// Deuxième colonne
                      Text('c 2: '),
                      Text('colonne'),

                      SizedBox(width: 10),

// Deuxième colonne
                      Text('c 3: '),
                      Text('BOUUUUH'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}