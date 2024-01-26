
import 'package:dev/pages/OrdersPage.dart';
import 'package:dev/widgets/CustomNavBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:dev/classes/OrderClass.dart';

import '../conf.dart';

class DetailCommandPage extends StatefulWidget {
  const DetailCommandPage({super.key});

  @override
  State<DetailCommandPage> createState() => _DetailCommandePageState();
}

class _DetailCommandePageState extends State<DetailCommandPage> {
  late final Order order;
  late final Function(int?, int?) updateOrderState;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double spacing;
    if (mediaQueryData.orientation == Orientation.portrait) {
      spacing = 150;
    } else {
      spacing = 300;
    }
    Padding paddedText(String text) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 2), // Ajustez la valeur selon vos besoins
        child: Text(text,style:  TextStyle(fontFamily: '${Conf.police}')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Wrap(
          spacing: spacing,
          children:  [
            Text("Clovis Delacroix",style: TextStyle(fontFamily: '${Conf.police}')),
            Text("N°6", style: TextStyle(fontFamily: '${Conf.police}')),
            Text("15h56",style: TextStyle(fontFamily: '${Conf.police}')),
            Text("50,00 €",style: TextStyle(fontFamily: '${Conf.police}')),
          ],
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 85,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 25, // Position en haut
            left: 25, // Position à gauche
            right: 25, // Position à droite
            bottom:
                150, // Position en bas avec un espace vertical de 100 pixels
            child: Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    width: 222,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(padding: EdgeInsets.only(bottom: 10),
                          child: Text("Entree",style: TextStyle(fontSize: 20,fontFamily: '${Conf.police}',decoration: TextDecoration.underline))
                        ),
                        paddedText("Test 1"),
                        paddedText("Test 2"),
                        paddedText("Test 3"),
                        paddedText("Test 4"),
                        paddedText("Test 5"),
                        paddedText("Test 6"),
                        paddedText("Test 7"),
                        paddedText("Test 8"),
                        paddedText("Test 9"),
                        paddedText("Test 10"),
                      ],
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
                    width: 222,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(padding: EdgeInsets.only(bottom: 10),
                            child: Text("Plat",style: TextStyle(fontSize: 20,fontFamily: '${Conf.police}',decoration: TextDecoration.underline))
                        ),
                        paddedText("Test 1"),
                        paddedText("Test 2"),
                        paddedText("Test 3"),
                        paddedText("Test 4"),
                        paddedText("Test 5"),
                        paddedText("Test 6"),
                        paddedText("Test 7"),
                        paddedText("Test 8"),
                        paddedText("Test 9"),
                        paddedText("Test 10"),
                      ],
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
                    width: 222,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(padding: EdgeInsets.only(bottom: 10),
                            child: Text("Dessert",style: TextStyle(fontSize: 20,fontFamily: '${Conf.police}',decoration: TextDecoration.underline))
                        ),
                        paddedText("Test 1"),
                        paddedText("Test 2"),
                        paddedText("Test 3"),
                        paddedText("Test 4"),
                        paddedText("Test 5"),
                        paddedText("Test 6"),
                        paddedText("Test 7"),
                        paddedText("Test 8"),
                        paddedText("Test 9"),
                        paddedText("Test 10"),
                      ],
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
                    width: 222,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(padding: EdgeInsets.only(bottom: 10),
                            child: Text("Sushi préfaits",style: TextStyle(fontSize: 20,fontFamily: '${Conf.police}',decoration: TextDecoration.underline))
                        ),
                        paddedText("Test 1"),
                        paddedText("Test 2"),
                        paddedText("Test 3"),
                        paddedText("Test 4"),
                        paddedText("Test 5"),
                        paddedText("Test 6"),
                        paddedText("Test 7"),
                        paddedText("Test 8"),
                        paddedText("Test 9"),
                        paddedText("Test 10"),
                      ],
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
                    width: 222,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ Padding(padding: EdgeInsets.only(bottom: 10),
                          child: Text("Sushi custom",style: TextStyle(fontSize: 20,fontFamily: '${Conf.police}',decoration: TextDecoration.underline))
                      ),
                        paddedText("Test 1"),
                        paddedText("Test 2"),
                        paddedText("Test 3"),
                        paddedText("Test 4"),
                        paddedText("Test 5"),
                        paddedText("Test 6"),
                        paddedText("Test 7"),
                        paddedText("Test 8"),
                        paddedText("Test 9"),
                        paddedText("Test 10"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                margin: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const OrdersPage()));
                    updateOrderState(3,order.idOrder);
                  },
                  style: ElevatedButton.styleFrom(fixedSize: const Size(200, 75),
                         shape: const StadiumBorder(),
                         backgroundColor: Colors.black
                  ),

                  child: Text("Terminer",style: TextStyle(fontFamily: '${Conf.police}',fontSize: 20)),
                ),
              ),
        ],
      ),
      bottomNavigationBar: const CustomNavBarWidget(),
    );
  }
}
