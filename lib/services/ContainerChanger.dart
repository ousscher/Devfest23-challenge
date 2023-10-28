import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ContainerChanger extends StatefulWidget {
  const ContainerChanger({super.key});

  @override
  State<ContainerChanger> createState() => _ContainerChangerState();
}

class _ContainerChangerState extends State<ContainerChanger> {
  List<Widget> templates = [template1, template2]; //lite de widget à afficher
  int currentIndex = 0;
  late Timer _timer; // Le timer pour changer les templates
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      //4 secondes pour changer les templates
      setState(() {
        currentIndex = (currentIndex + 1) % templates.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return templates[currentIndex];
  }
}

Widget template2 = Center(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/template2.png"),
          ),
        ),
      ),
    );
Widget template1  = Center(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/template1.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
