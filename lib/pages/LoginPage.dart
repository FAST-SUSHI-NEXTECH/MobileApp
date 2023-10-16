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
              child: const Text("FastSushi",
                style: TextStyle(fontFamily: 'Comfortaa',
                    fontSize: 30),
              ),
            ),
            Image.asset("assets/images/logo_blanc.png",
              width: 100,),
          ],
        ),
        backgroundColor: const Color(0xFF000000),
        toolbarHeight: 125,
      ),
      body: Container(
        margin: EdgeInsets.only(right: 150, left: 150),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Identifiant",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Mot de passe",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}



  