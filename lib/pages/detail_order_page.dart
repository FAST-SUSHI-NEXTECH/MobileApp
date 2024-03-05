import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../classes/OrderClass.dart';
import '../conf.dart';
import '../widgets/order_detail_appbar.dart';
import '../pages/OrdersPage.dart';

void main() {
  runApp(const MaterialApp(
    home: DetailOrderPage(),
  ));
}

class DetailOrderPage extends StatefulWidget {
  final int? orderId;
  final int? pickerId;
  final String? date;
  final int? currentPickerId;
  const DetailOrderPage(
      {super.key, this.orderId, this.pickerId, this.date, this.currentPickerId});

  @override
  State<StatefulWidget> createState() {
    return _DetailOrderPageState();
  }
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  final Map<String, Set<int>> _selectedIndexesByCategory = {
    'Appetizers': <int>{},
    'Plates': <int>{},
    'Desserts': <int>{},
  };
  int _checklist = 0;
  int _orderlength = 1;

  void _toggleSelection(String category, int index) {
    setState(() {
      if (_selectedIndexesByCategory[category]!.contains(index)) {
        _selectedIndexesByCategory[category]!.remove(index);
        _checklist--;
      } else {
        _selectedIndexesByCategory[category]!.add(index);
        _checklist++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderId = widget.orderId;
    final pickerId = widget.pickerId;
    final date = widget.date;
    final currentPickerId = widget.currentPickerId;

    return Scaffold(
        appBar: OrderAppBar(
            order: Order(
          idOrder: orderId,
          idPicker: pickerId,
                time: date
        )),
        body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60.0,
                width: 900,
                alignment: Alignment.center,
                child: Row(
                  // Utilisation d'une Row pour disposer horizontalement les widgets
                  children: [
                    Expanded(
                      // Utilisation d'Expanded pour que le LinearProgressIndicator prenne tout l'espace disponible moins celui du texte
                      child: LinearProgressIndicator(
                        value: _checklist / _orderlength,
                        backgroundColor: Colors.grey[350],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          (_checklist / _orderlength) == 1
                              ? Colors.green
                              : Colors.blue,
                        ),
                        minHeight: 12,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    Padding(
                      // Ajout d'un peu d'espace entre le LinearProgressIndicator et le texte
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                          "${(_checklist / _orderlength * 100).toStringAsFixed(0)} %", // Affichage du pourcentage
                          style:
                              TextStyle(fontFamily: Conf.police, fontSize: 20)),
                    ),
                  ],
                ),
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Affichez vos listes ici en utilisant le même modèle pour appetizers, plates, et desserts
                  _buildListSection(
                      orderId, 'Appetizers', currentPickerId, pickerId),
                  Flexible(
                      flex: 1, // 13% de l'espace
                      child: Container(
                          height: 550,
                          alignment: Alignment.center,
                          child: const VerticalDivider(
                              thickness: 3, color: Colors.black54))),
                  _buildListSection(
                      orderId, 'Plates', currentPickerId, pickerId),
                  Flexible(
                      flex: 1, // 13% de l'espace
                      child: Container(
                          height: 550,
                          alignment: Alignment.center,
                          child: const VerticalDivider(
                              thickness: 3, color: Colors.black54))),
                  _buildListSection(
                      orderId, 'Desserts', currentPickerId, pickerId),
                ],
              )),
              Container(
                  height: 100.0,
                  width: 900,
                  alignment: Alignment.center,
                  child:
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          (_checklist / _orderlength) == 1 ? Colors.blue : Colors.grey,
                        )
                    ),
                    onPressed: () {
                      if (_checklist / _orderlength == 1){
                        //onUpdateOrderState(3, order.idOrder);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrdersPage()
                          ),
                        );
                      }
                    },
                    child: const Text('Terminer la commande'),
                  )
              ),
          ]
      )
    );
  }

  Widget _buildListSection(
      int? orderId, String category, int? currentPickerId, int? pickerId) {
    // Remplacer par la récupération et le filtrage de vos données réelles en fonction de la catégorie
    // Ceci est un placeholder pour l'exemple
    return Flexible(
      flex: 20,
      child: Container(
        height: 540.0,
        alignment: Alignment.topCenter,
        child: FutureBuilder<List<Order>>(
          future: Orders().fetchOrdersContent(orderId),
          builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
            if (snapshot.hasError) {
              return Text('Erreur',
                  style: TextStyle(fontFamily: Conf.police, fontSize: 20));
            }
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            List<Order> orders = [];
            _orderlength = snapshot.data!
                    .where((order) => order.orderContentAppetizer != null)
                    .toList()
                    .length +
                snapshot.data!
                    .where((order) => order.orderContentPlate != null)
                    .toList()
                    .length +
                snapshot.data!
                    .where((order) => order.orderContentDessert != null)
                    .toList()
                    .length;

            // Filtrer les données en fonction de la catégorie si nécessaire
            if (category == 'Appetizers') {
              orders = snapshot.data!
                  .where((order) => order.orderContentAppetizer != null)
                  .toList();
            } else if (category == 'Plates') {
              orders = snapshot.data!
                  .where((order) => order.orderContentPlate != null)
                  .toList();
            } else if (category == 'Desserts') {
              orders = snapshot.data!
                  .where((order) => order.orderContentDessert != null)
                  .toList();
            }

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                bool isSelected =
                    _selectedIndexesByCategory[category]!.contains(index);

                return InkWell(
                    onTap: () {
                      if (currentPickerId == pickerId) {
                        _toggleSelection(category, index);
                      }
                    },
                    child: Row(children: [
                      Container(
                          padding: const EdgeInsets.only(right: 20, left: 10),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${Conf.ipImage}/images/product/${order.idProduct}/image/image.png",
                            height: 100,
                            width: 100,
                          )),
                      Text(
                        _getTextForCategory(order, category),
                        style: TextStyle(
                          fontFamily: Conf.police,
                          fontSize: 18,
                          color: isSelected ? Colors.grey : null,
                          decoration:
                              isSelected ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ]));
              },
            );
          },
        ),
      ),
    );
  }

  String _getTextForCategory(Order order, String category) {
    switch (category) {
      case 'Appetizers':
        return order.orderContentAppetizer ?? '';
      case 'Plates':
        return order.orderContentPlate ?? '';
      case 'Desserts':
        return order.orderContentDessert ?? '';
      default:
        return '';
    }
  }
}
