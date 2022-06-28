<<<<<<< Updated upstream
import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/screens/profilepage.dart';
import 'package:flexj/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Authorize the app
              },
<<<<<<< Updated upstream
              child: Text('Yesterday you walked!')),
            ),
=======
              child: const Text('Yesterday you walked!')),
            
>>>>>>> Stashed changes
            ElevatedButton(
              onPressed: () async {
                await FitbitConnector.unauthorize(
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,);
              },
              child: Text('Tap to unauthorize'),
            ),
          ],
      ),
    )
    );
    
  }
}




<<<<<<< Updated upstream
FetchedFitData Fetch(userID, ){
   String? userId = await FitbitConnector.authorize(
                    context: context,
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    redirectUri: Strings.fitbitRedirectUri,
                    callbackUrlScheme: Strings.fitbitCallbackScheme);
                    
                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager = FitbitActivityTimeseriesDataManager(
                                clientID: Strings.fitbitClientID,
                                clientSecret: Strings.fitbitClientSecret,
                                type: 'steps',
                    );

                //Fetch data
                final stepsData = await fitbitActivityTimeseriesDataManager.fetch(
                                          FitbitActivityTimeseriesAPIURL.dayWithResource(
                                            date: DateTime.now().subtract(Duration(days: 1)),
                                            userID: userId,
                                            resource: fitbitActivityTimeseriesDataManager.type,
                                          )
                                        ) as List<FitbitActivityTimeseriesData>;

}







class FetchedFitData{

  double? passi;
  double? bpm;
  List<FitbitActivityTimeseriesData>? hr;
  
  FetchedFitData();

  FetchedFitData.withstep({this.passi});
  FetchedFitData.withhr({this.bpm});
  FetchedFitData.withtimehr({this.hr});

}


Future<FetchedFitData> fetchin() async{

  FetchedFitData fitData;

  
  String? userId = await FitbitConnector.authorize(
                    context: context,
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    redirectUri: Strings.fitbitRedirectUri,
                    callbackUrlScheme: Strings.fitbitCallbackScheme);
                    
                //Instantiate a proper data manager
  FitbitActivityTimeseriesDataManager fitbitActivityTimeseriesDataManager = 
                    FitbitActivityTimeseriesDataManager(
                                clientID: Strings.fitbitClientID,
                                clientSecret: Strings.fitbitClientSecret,
                                type: 'steps',
                    );

                //Fetch data
                final hrData = await fitbitActivityTimeseriesDataManager.fetch(
                                          FitbitActivityTimeseriesAPIURL.dayWithResource(
                                            date: DateTime.now().subtract(Duration(days: 1)),
                                            userID: userId,
                                            resource: fitbitActivityTimeseriesDataManager.type,
                                          )
                                        ) as List<FitbitActivityTimeseriesData>;


    fitData=FetchedFitData.withstep(passi: 10);
    fitData=FetchedFitData.withhr(bpm: 100);
    fitData=FetchedFitData.withtimehr(hr: hrData);


  return fitData;
}








Future Data getdata
=======



>>>>>>> Stashed changes


















class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);
=======

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HomePage';

>>>>>>> Stashed changes

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
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
=======
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Home',
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("to dashboard"))
          ],
        ));
>>>>>>> Stashed changes
  }
}
