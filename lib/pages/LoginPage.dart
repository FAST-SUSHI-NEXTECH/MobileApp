import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:intl/intl.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _popupMessage = '';


  void postData() async {
    print('test');
    print(usernameController.text);
    print(passwordController.text);
    final response = await http.post(
      Uri.parse('http://185.255.112.208:3000/login'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': usernameController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Gérer la réponse réussie ici
      print('Réponse du serveur : ${response.body}');
    } else {
      // Gérer l'échec de la requête ici
      print('Échec de la requête : ${response.statusCode}');
    }
  }

  // void sendEmail(String nom, String prenom, String numero, String email) async {
  //   final Uri emailLaunchUri = Uri(
  //     scheme: 'mailto',
  //     path: 'esposito.raphael1@gmail.com',
  //     queryParameters: {
  //       'subject': 'Informations utilisateur',
  //       'body': 'Nom: $nom\nPrénom: $prenom\nNuméro de téléphone: $numero\nEmail: $email',
  //     },
  //   );
  //
  //   if (await canLaunchUrlString(emailLaunchUri.toString())) {
  //     await launchUrlString(emailLaunchUri.toString());
  //   } else {
  //     print('Impossible de lancer l\'e-mail.');
  //   }
  // }

  void showForgotPwdPopup(BuildContext context) {
    String nom = '';
    String prenom = '';
    String numero = '';
    String email = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Entrer vos informations'),
          content: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    onChanged: (value) {
                      nom = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nom',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      prenom = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Prénom',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      numero = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Numéro de téléphone',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Annuler',style: TextStyle(fontSize: 18)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _popupMessage = 'Mail Envoyé';
                    });

                    Navigator.of(context).pop();

                    _showConfirmationPopup(context);
                  },
                  child: const Text('Envoyer',style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        );
      },
    );
  }

  void _showConfirmationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: Text(
            _popupMessage,
            style: TextStyle(
              color: _popupMessage == 'Mail Envoyé' ? Colors.green : Colors.red,
              fontSize: 18,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermez la popup de confirmation
              },
              child: const Text('OK'),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        );
      },
    );
  }



  Future<String> _getCurrentTime() async {
    DateTime now = DateTime.now();
    DateTime adjustedTime = now.add(const Duration(hours: 1)); // Utilisez toLocal pour ajuster le fuseau horaire
    String formattedTime = DateFormat.Hm().format(adjustedTime); // Utilisez DateFormat pour formater l'heure
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin : EdgeInsets.only(left: 100),
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
        actions: [
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 15),
            child: FutureBuilder(
              future: _getCurrentTime(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.data.toString(),
                        style: const TextStyle(fontSize: 30)),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 100),
        children: [
          Container(
            alignment: Alignment.center,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 500,
                    child: TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        hintText: "Identifiant",
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 500,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        hintText: "Mot de passe",
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: postData,
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      child: const Text("Connexion"),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      showForgotPwdPopup(context);
                    },
                    child: const Text("Mot de passe oublié ?"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
