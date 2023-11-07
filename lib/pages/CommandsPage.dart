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

              Text('Numéro',style: TextStyle(fontFamily: 'Comfortaa')), // Première colonne

              Text('Heure d\'arrivée',style: TextStyle(fontFamily: 'Comfortaa')), // Deuxième colonne

              Text('Details de la commande',style: TextStyle(fontFamily: 'Comfortaa')), // troisième colonne

              Text('Préparateur',style: TextStyle(fontFamily: 'Comfortaa')), // quatrième colonne

              Text('Etat commandes',style: TextStyle(fontFamily: 'Comfortaa')), // cinquième colonne
            ],
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(10), // Ajoute un padding de 10 pixels autour de la liste
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
                      duration: const Duration(milliseconds: 250),
                      height: isExpanded[index] ? 100.0 : 50.0, // Hauteur agrandie ou normale
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600, width: 2), // Bordure noire autour de l'élément
                      ),
                      padding: const EdgeInsets.only(top: 6),
                      margin: const EdgeInsets.only(bottom:5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('N°$index',style: const TextStyle(fontFamily: 'Comfortaa')), // Première colonne

                              const Text('15h45',style: TextStyle(fontFamily: 'Comfortaa')), // Deuxième colonne

                              const Text('x1 Sushi, x2 Soupe miso',style: TextStyle(fontFamily: 'Comfortaa')), // troisième colonne

                              const Text('Patrick',style: TextStyle(fontFamily: 'Comfortaa')), // quatrième colonne

                              Container( // cinquième colonne
                                width: 100,
                                height: 35,
                                color: Colors.green.shade300,
                                child: const Center(
                                  child: Text(
                                    "Prête",
                                    style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      color: Colors.black54,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
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
                                    fontFamily: 'Comfortaa',
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


