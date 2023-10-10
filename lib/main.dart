import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            children: [
              Container(
                margin: const EdgeInsets.only(right: 0),
                child: const Text("FastSushi",
                style: TextStyle(fontFamily: 'Comfortaa')
                  ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: SvgPicture.asset("assets/images/logo_blanc.svg",
                  width: 150,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        backgroundColor: const Color(0xFF000000),
        toolbarHeight: 125,
      ),
    );
  }
}

