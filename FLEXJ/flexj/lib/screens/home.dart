import 'package:flexj/screens/profilepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class newhome extends StatefulWidget {
  const newhome({Key? key}) : super(key: key);

  @override
  State<newhome> createState() => newhomeState();
}

class newhomeState extends State<newhome> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    dashboard(),
    steps(),
    hf(),
    sleep(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     'Dashboard',
      //   ),
      //   backgroundColor: Colors.black,
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         leading: Icon(
      //           Icons.home,
      //         ),
      //         title: const Text('Profile'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart),
            label: 'Heart Frequency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bedtime),
            label: 'Sleep',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}

class steps extends StatefulWidget {
  const steps({Key? key}) : super(key: key);

  @override
  State<steps> createState() => _stepsState();
}

class _stepsState extends State<steps> {
  @override
  Widget build(BuildContext context) {
    int obiettivoPassi = 8000;
    int passiDay = 5000;
    double counter = passiDay * 0.60;
    double peso = 80;
    double cal = 0.5 * peso * counter / 1000;
    double passiPercent = passiDay / obiettivoPassi * 100;
    if (passiPercent > 100) {
      passiPercent = 100;
    }

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
              Colors.purple,
              Colors.red,
            ])),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularStepProgressIndicator(
                totalSteps: obiettivoPassi,
                currentStep: passiDay,
                stepSize: 10,
                selectedColor: Colors.red,
                unselectedColor: Colors.black,
                padding: 0,
                width: 250,
                height: 250,
                selectedStepSize: 15,
              ),
              Text(
                "$passiPercent %",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 80),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_fire_department),
                      Text("Calories= $cal kcal")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.directions_walk), Text("$counter m")],
                  )
                ],
              )
            ]));
  }
}

class hf extends StatefulWidget {
  const hf({Key? key}) : super(key: key);

  @override
  State<hf> createState() => _hfState();
}

class _hfState extends State<hf> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    double peso = 85.50;
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

class sleep extends StatefulWidget {
  const sleep({Key? key}) : super(key: key);

  @override
  State<sleep> createState() => _sleepState();
}

class _sleepState extends State<sleep> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
            Colors.indigo.shade900,
            Colors.indigo,
          ])),
    );
  }
}
