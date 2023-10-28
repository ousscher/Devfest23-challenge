import 'dart:ffi';
import 'dart:io';

import 'package:devfest23/pages/Menu.dart';
import 'package:devfest23/services/ContainerChanger.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<Widget> fields = [
    const SizedBox(
      width: 20.0,
    ),
    FieldCard(imagePath: "assets/images/mobile.png", title: "Mobile"),
    const SizedBox(
      width: 20.0,
    ),
    FieldCard(imagePath: "assets/images/web.png", title: "Web"),
    const SizedBox(
      width: 20.0,
    ),
    FieldCard(imagePath: "assets/images/ai.png", title: "Ai"),
    const SizedBox(
      width: 20.0,
    ),
    FieldCard(imagePath: "assets/images/game.png", title: "Game Dev"),
    const SizedBox(
      width: 20.0,
    ),
    FieldCard(imagePath: "assets/images/security.png", title: "Security"),
    const SizedBox(
      width: 20.0,
    ),
  ];
  List<Widget> previousDevests = [
    DevfestCard(
        content:
            "DevFest \"Developers\" Festival is an annual, international festival organized by Google Developer Groups (GDG) from around the world.",
        imagePath: "assets/images/logo1.png",
        title: "DevFest 2022"),
    const SizedBox(
      height: 20.0,
    ),
    DevfestCard(
        content:
            "DevFest \"Developers\" Festival is an annual, international festival organized by Google Developer Groups (GDG) from around the world.",
        imagePath: "assets/images/logo3.png",
        title: "DevFest 2021"),
    const SizedBox(
      height: 15.0,
    ),
    DevfestCard(
        content:
            "DevFest \"Developers\" Festival is an annual, international festival organized by Google Developer Groups (GDG) from around the world.",
        imagePath: "assets/images/logo1.png",
        title: "DevFest 2020"),
    const SizedBox(
      height: 15.0,
    ),
    DevfestCard(
        content:
            "DevFest \"Developers\" Festival is an annual, international festival organized by Google Developer Groups (GDG) from around the world.",
        imagePath: "assets/images/logo3.png",
        title: "DevFest 2019"),
    const SizedBox(
      height: 15.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //la variable globale du size
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: const Color.fromARGB(162, 247, 247, 247),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //le logo et le button home
                Container(
                  height: 0.07 * size.height,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 0.2 * size.width,
                        child: InkWell(
                            onTap: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: Image.asset("assets/images/menu.png")),
                      ),
                      Container(
                        width: 0.5 * size.width,
                        child: Image.asset("assets/images/logo2.png"),
                      ),
                      Container(
                        width: 0.2 * size.width,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    height: 0.2 * size.height,
                    width: 0.9 * size.width,
                    child: const ContainerChanger(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                  child: Text(
                    "Our Fields",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: fields,
                  ),
                ),
                //previous devfest
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                  child: Text(
                    "Previous Devfest's",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Column(
                  children: previousDevests,
                )
              ],
            ),
          ),
        ),
      ),
      drawer: Menu(),
    );
  }
}

class FieldCard extends StatelessWidget {
  //le widget qui contient le field (exp ai , web ...)
  String imagePath;
  String title;
  FieldCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: 0.35 * size.width,
      height: 0.15 * size.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imagePath),
          Text(title),
        ],
      ),
    );
  }
}

class DevfestCard extends StatelessWidget {
  String imagePath;
  String title;
  String content;
  DevfestCard(
      {super.key,
      required this.content,
      required this.imagePath,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: 0.2 * size.height,
        width: 0.94 * size.width,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: 0.32 * size.width,
              child: Image.asset(imagePath),
            ),
            Container(
              width: 0.62 * size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue[200],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
