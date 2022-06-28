import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/screens/profilepage.dart';

import 'package:flutter/material.dart';
import 'package:flexj/utils/strings.dart';

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
              Color.fromARGB(255, 212, 255, 0),
              Colors.black,
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
                      children: [
                        const Text('Peso:'),
                        Text("$peso"),
                        Text("Kg")
                      ],
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
            ),
            body: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 564,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                      onPressed: () async {
                        String? userId = await FitbitConnector.authorize(
                            context: context,
                            clientID: Strings.fitbitClientID,
                            clientSecret: Strings.fitbitClientSecret,
                            redirectUri: Strings.fitbitRedirectUri,
                            callbackUrlScheme: Strings.fitbitCallbackScheme);

                        final snackBar = SnackBar(content: Text("Connesso"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("Autorize")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await FitbitConnector.unauthorize(
                          clientID: Strings.fitbitClientID,
                          clientSecret: Strings.fitbitClientSecret,
                        );
                        final snackBar = SnackBar(content: Text("Disconnesso"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("Unauthorize"))
                ])
              ],
            )));
  }
}
