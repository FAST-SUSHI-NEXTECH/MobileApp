import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 0),
              child: const Text(
                "FastSushi",
                style: TextStyle(fontFamily: 'Comfortaa', fontSize: 30),
              ),
            ),
            Image.asset(
              "assets/images/logo_blanc.png",
              width: 100,
            ),
          ],
        ),
        backgroundColor: const Color(0xFF000000),
        toolbarHeight: 125,
      ),
      body: Container(
        margin: const EdgeInsets.only(right: 150, left: 150),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Identifiant",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2, // Ajustez l'épaisseur de la bordure ici
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: "Mot de passe",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2, // Ajustez l'épaisseur de la bordure ici
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  child: const Text("Envoyer"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
