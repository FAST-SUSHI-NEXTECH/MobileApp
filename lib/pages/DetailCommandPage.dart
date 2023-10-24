import 'package:flutter/material.dart';

class DetailCommandePage extends StatefulWidget {
  const DetailCommandePage({super.key});

  @override
  State<DetailCommandePage> createState() => _DetailCommandePageState();
}

class _DetailCommandePageState extends State<DetailCommandePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Wrap(
            spacing: 150,
            children: [
              Text("Clovis Delacroix"),
              Text("N°6"),
              Text("15h56"),
              Text("50,00 €"),
            ],
          ),
          backgroundColor: Colors.black,
          toolbarHeight: 85,
        ),
        body: ElevatedButton(
            onPressed: () {}, child:
            const Text("Revenir")));
  }
}
