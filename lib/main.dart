import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
import 'pages/LogoWidget.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Wrapper(),
  ));
}

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool _showLogo = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      //le moment ou on veut afficher le logo
      setState(() {
        _showLogo = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _showLogo
            ? LogoWidget() //afficher le logo
            : HomePage(), //afficher le home
      ),
    );
  }
}




