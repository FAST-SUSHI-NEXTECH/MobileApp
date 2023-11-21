import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void postData() async {
    print('test');
    print(usernameController.text);
    print(passwordController.text);
    final response = await http.post(
      Uri.parse('http://185.255.112.208:3000/login'),
      body: {
        'identifiant': usernameController.text,
        'mdp': passwordController.text,
      }
    );
    
    if (response.statusCode == 200) {
      // Gérer la réponse réussie ici
      print('Réponse du serveur : ${response.body}');
    } else {
      // Gérer l'échec de la requête ici
      print('Échec de la requête : ${response.statusCode}');
    }
  }

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
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: "Identifiant",
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                  hintText: "Mot de passe",
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: postData, // Appel de la méthode postData ici
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
