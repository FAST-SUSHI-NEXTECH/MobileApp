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

        body: Padding(
          padding: const EdgeInsets.all(5), // Ajoute un padding de 10 pixels autour de la liste
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded[index] = !isExpanded[index];
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: isExpanded[index] ? 100.0 : 50.0, // Hauteur agrandie ou normale
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2), // Bordure noire autour de l'élément
                      ),
                      child: Center(
                        child: Row(
                          children: [

                            Text('Colonne 1: '),
                            Text('Élément $index'), // première colonne

                            SizedBox(width: 10),

                            Text('c 2: '),
                            Text('colonne'), // Deuxième colonne

                            SizedBox(width: 10),

                            Text('c 3: '),
                            Text('BOUUUUH'), // troisième colonne
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5), // Espacement vertical entre les éléments
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
