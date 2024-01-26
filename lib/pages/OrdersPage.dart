import 'package:dev/widgets/order_detail_button.dart';
import 'package:flutter/material.dart';
import 'package:dev/classes/OrderClass.dart';
import 'package:dev/classes/PickerClass.dart';
import 'package:dev/widgets/order_state_button.dart';
import 'package:dev/widgets/order_state_container.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  String currentOrderState = "new";
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
    List<Order> fetchedOrders = await orders.fetchOrders(currentOrderState);
    setState(() {
      ordersList = fetchedOrders;
    });
  }

  // Méthode pour appeler updateOrderState et mettre à jour l'état de la commande
  Future<void> updateOrderState(int? orderState, int? orderId) async {
    await orders.updateOrderState(orderState, orderId);
    // Recharger les commandes pour mettre à jour l'interface utilisateur
    fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( // Remplit l'espace disponible
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false, // Supprime le bouton pour revenir en arrière
          toolbarHeight: 40,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 10, // 13% de l'espace
                child: Container(
                  alignment: Alignment.center,
                  child: Text('Numéro',style: TextStyle(fontFamily: 'Comfortaa')), // Première colonne
                )
              ),
              Flexible(
                  flex: 10, // 13% de l'espace
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Heure d\'arrivée',style: TextStyle(fontFamily: 'Comfortaa')), // Deuxième colonne
                  )
              ),
              Flexible(
                  flex: 30, // 38% de l'espace
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Details de la commande',style: TextStyle(fontFamily: 'Comfortaa')), // troisième colonne
                  )
              ),
              Flexible(
                  flex: 15, // 18% de l'espace
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Préparateur',style: TextStyle(fontFamily: 'Comfortaa')), // quatrième colonne
                  )
              ),
              Flexible(
                flex: 15, // 18% de l'espace
                child: Container(
                  alignment: Alignment.center,
                  child: Text('Etat commandes',style: TextStyle(fontFamily: 'Comfortaa')), // troisième colonne
                )
              )
            ]
          )
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
                            children: [
                              Flexible(
                                flex: 10, // 20% de l'espace
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text('N°${order.idOrder}', style: const TextStyle(fontFamily: 'Comfortaa')),
                                ),
                              ),
                              Flexible(
                                flex: 10, // 30% de l'espace
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(order.time ?? 'Inconnu', style: const TextStyle(fontFamily: 'Comfortaa')),
                                ),
                              ),
                              Flexible(
                                flex: 30, // 50% de l'espace
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text('Id de la commande : ${order.idOrder}', style: const TextStyle(fontFamily: 'Comfortaa')),
                                ),
                              ),

                              Flexible(
                                  flex: 15, // 50% de l'espace
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: FutureBuilder<String>(
                                        future: Pickers().fetchPickerUsername(order.idPicker),
                                        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                          if (snapshot.hasError) {
                                            return const Text('Erreur', style: TextStyle(fontFamily: 'Comfortaa'));
                                          } else {
                                            return Text('${snapshot.data}', style: const TextStyle(fontFamily: 'Comfortaa'));
                                          }
                                        },
                                      ),
                                  )
                              ),

                              Flexible(
                                flex: 15, // 50% de l'espace
                                child: Container(
                                  alignment: Alignment.center,
                                  child: OrderStateContainer(orderState: order.orderState)
                                )
                              )
                            ]
                          ),
                          Expanded(
                            child: Visibility(
                              visible: expandedIndex == index, // Affiche le texte uniquement lorsque l'élément est agrandi
                              child: Center( // Centre les enfants horizontalement et verticalement
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center, // Centre les enfants horizontalement dans la Row
                                  children: [
                                    OrderStateButton(
                                      orderState: order.orderState,
                                      order: order,
                                      onUpdateOrderState: updateOrderState,
                                      onUpdateOrderPicker: updateOrderPicker,
                                    ),
                                    OrderDetailButton(
                                      orderState: order.orderState,
                                      order: order,
                                      onUpdateOrderState: updateOrderState,
                                    ),
                                  ],
                                ),
                              ),
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


