import 'package:flexj/screens/profilepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    int peso = 85;
    double altezza = 185;
    double bodymass = peso / ((altezza / 100) * (altezza / 100));
    String BMI = bodymass.toStringAsFixed(1);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
            Colors.black,
            Colors.purple,
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                // const DrawerHeader(
                //   decoration: BoxDecoration(
                //     color: Colors.purple,
                //   ),
                //   child: Text('Drawer Header'),
                // ),
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "FLEXJ",
                        style: TextStyle(fontSize: 40),
                      )
                    ],
                  ),
                ),

                Card(
                    shadowColor: Colors.purple,
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                      ),
                      trailing: const Icon(Icons.arrow_right),
                      title: const Text('Profile'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()));
                      },
                    )),

                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Nome utente'),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [const Text('Peso:'), Text("$peso"), Text("Kg")],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Altezza:'),
                      Text("$altezza"),
                      Text("cm")
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [const Text('BMI:'), Text("$BMI")],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
