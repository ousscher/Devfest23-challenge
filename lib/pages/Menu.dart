import 'package:devfest23/pages/About.dart';
import 'package:devfest23/pages/HomePage.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void _closeDrawer() {
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: SafeArea(
        child: Container(
          // La moitié de la largeur de l'écran
          color: Colors.white, // Couleur de fond du menu
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: 0.14 * size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/texture.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ListTile(
                  title: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    _closeDrawer();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                  },
                ),
                ListTile(
                  title: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Text(
                        "About",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    _closeDrawer();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AboutPage(),
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
