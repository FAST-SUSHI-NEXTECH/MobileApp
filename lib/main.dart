import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                style: TextStyle(fontFamily: 'Comfortaa')
                  ),
              ),
              Image.asset("assets/images/logo_blanc.png"),
            ],
          ),
        backgroundColor: const Color(0xFF000000),
        toolbarHeight: 125,
      ),
    );
  }
}

