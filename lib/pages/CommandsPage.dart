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
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          toolbarHeight: 40,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Text('numéro'), // Première colonne

              Text('Heure d\'arrivée'), // Deuxième colonne

              Text('Details de la commande'), // troisième colonne

              Text('Préparateur'), // quatrième colonne

              Text('Etat commandes'), // cinquième colonne
            ],
          ),
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
                      padding: const EdgeInsets.only(top: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('N°$index'), // Première colonne

                              const Text('15h45'), // Deuxième colonne

                              const Text('x1 Sushi, x2 Soupe miso'), // troisième colonne

                              const Text('Patrick'), // quatrième colonne

                              Container( // cinquième colonne
                                width: 100,
                                height: 35,
                                color: Colors.green,
                                child: const Center(
                                  child: Text(
                                    "Prête",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ), // cinquième colonne
                            ],
                          ),
                          Visibility(
                            visible: isExpanded[index], // Affiche le texte uniquement lorsque l'élément est agrandi
                            child: ElevatedButton.icon(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Colors.green)
                              ),
                              onPressed: () => {
                                Navigator.push(context, PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => const CommandsPage()
                                )),
                              },
                              label: const Text("Commande récupéré",
                                style: TextStyle(
                                    fontSize: 15
                                ),
                              ),
                              icon: const Icon(Icons.check),
                            ),
                          ),
                        ],
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


