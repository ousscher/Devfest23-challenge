import 'package:devfest23/pages/Menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                Image.asset("assets/images/gdg.png"),
                SizedBox(
                  height: 40.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "GDG Algiers is a local community situated at the Higher National School of Computer Science in Algiers (ESI ex INI), Algiers, Algeria. It is partty of developers \"Google Developers Group\" an inclusive environment where anyone interested in tech is welcome to join.Our community gathers motivated young students with similar interests in Google technologies and devoted developers.",
                      style: TextStyle(
                      fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
