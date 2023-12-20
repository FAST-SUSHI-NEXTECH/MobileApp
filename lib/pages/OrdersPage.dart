import 'package:flutter/material.dart';
import 'package:dev/classes/OrderClass.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int expandedIndex = -1; // Index de l'élément étendu, -1 signifie aucun élément étendu
  // Instancie la classe Orders
  Orders orders = Orders();
  List<Order> ordersList = []; // Liste pour stocker les objets Order

  @override
  void initState() {
    super.initState();
    // Appel de la méthode fetchOrders lors de l'initialisation de la page
    fetchOrders();
  }

  // Méthode pour appeler fetchOrders et mettre à jour l'état de la liste Order
  Future<void> fetchOrders() async {
    List<Order> fetchedOrders = await orders.fetchOrders();
    setState(() {
      ordersList = fetchedOrders;
    });
  }

  Widget _buildOrderStateContainer(int? orderState) {
    switch (orderState) {
      case 1:
        return Container(
          width: 150,
          height: 35,
          color: Colors.red.shade200,
          child: const Center(
            child: Text(
              "En attente",
              style: TextStyle(
                fontFamily: 'Comfortaa',
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
          ),
        );
      case 2:
        return Container(
          width: 150,
          height: 35,
          color: Colors.orange.shade200,
          child: const Center(
            child: Text(
              "En cours",
              style: TextStyle(
                fontFamily: 'Comfortaa',
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
          ),
        );
      case 3:
        return Container(
          width: 150,
          height: 35,
          color: Colors.green.shade200,
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
        );
      default:
        return Container(); // Conteneur vide ou avec un contenu par défaut
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( // Remplit l'espace disponible
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false, // Supprime le bouton pour revenir en arrière
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
            itemCount: ordersList.length,
            itemBuilder: (context, index) {
              Order order = ordersList[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (expandedIndex == index) {
                          expandedIndex = -1; // Rétracte l'élément si c'est déjà étendu
                        } else {
                          expandedIndex = index; // Étend l'élément cliqué
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      height: expandedIndex == index ? 100.0 : 50.0, // Hauteur agrandie ou normale
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600, width: 2), // Bordure noire autour de l'élément
                      ),
                      padding: const EdgeInsets.only(top: 6),
                      margin: const EdgeInsets.only(bottom:5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('N°${order.idOrder}',style: const TextStyle(fontFamily: 'Comfortaa')), // Première colonne (Id Order)

                              Text(order.time ?? 'Inconnu', style: const TextStyle(fontFamily: 'Comfortaa')), // Deuxième colonne (Heure)

                              Text('détails de la commande : ${order.idOrder}',style: const TextStyle(fontFamily: 'Comfortaa')), // Troisième colonne (Id Order)

                              Text('Id préparateur : ${order.idPicker}',style: const TextStyle(fontFamily: 'Comfortaa')), // Troisième colonne (Id Order)

                              _buildOrderStateContainer(order.orderState),
                            ],
                          ),
                          Visibility(
                            visible: expandedIndex == index, // Affiche le texte uniquement lorsque l'élément est agrandi
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.green)
                              ),
                              onPressed: () => {
                                Navigator.push(context, PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => const OrdersPage()
                                )),
                              },
                              label: const Text("Commande récupérée",
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


