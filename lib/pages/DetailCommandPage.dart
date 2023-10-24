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
      body: Row(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomStart,
            margin: const EdgeInsets.only(left: 50, bottom: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, )
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(175, 75)),
              child: const Text("Revenir"),
            ),
          ),
          SizedBox(width: 800),
          Container(
            alignment: AlignmentDirectional.bottomEnd,
            margin: const EdgeInsets.only(right: 50, bottom: 50),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(fixedSize: const Size(175, 75)),
              child: const Text("Terminer"),
            ),
          ),
        ],
      ),

    );
  }
}
