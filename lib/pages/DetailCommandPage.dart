import 'package:dev/pages/CommandsPage.dart';
import 'package:flutter/material.dart';

class DetailCommandPage extends StatefulWidget {
  const DetailCommandPage({super.key});

  @override
  State<DetailCommandPage> createState() => _DetailCommandePageState();
}

class _DetailCommandePageState extends State<DetailCommandPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double spacing;
    if (mediaQueryData.orientation == Orientation.portrait) {
      spacing = 150;
    } else {
      spacing = 300;
    }

    return Scaffold(
      appBar: AppBar(
        title: Wrap(
          spacing: spacing,
          children: const [
            Text("Clovis Delacroix"),
            Text("N°6"),
            Text("15h56"),
            Text("50,00 €"),
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
                      width: 222,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.circular(25))),
                  SizedBox(width: 25),
                  Container(
                      width: 222,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.circular(25))),
                  SizedBox(width: 25),
                  Container(
                      width: 222,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.circular(25))),
                  SizedBox(width: 25),
                  Container(
                      width: 222,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.circular(25))),
                  SizedBox(width: 25),
                  Container(
                      width: 222,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.circular(25))),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  alignment: AlignmentDirectional.bottomStart,
                  margin: const EdgeInsets.only(left: 50, bottom: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const CommandsPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(175, 75)),
                    child: const Text("Revenir"),
                  ),
                ),
              ),
              SizedBox(width: 800),
              Container(
                alignment: AlignmentDirectional.bottomEnd,
                margin: const EdgeInsets.only(right: 50, bottom: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const CommandsPage()));
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(175, 75)),
                  child: const Text("Terminer"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
