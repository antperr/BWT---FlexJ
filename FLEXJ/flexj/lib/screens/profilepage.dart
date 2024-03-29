import 'package:flexj/screens/home.dart';
import 'package:flexj/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ProfilePageWidget(),
        ),
      ),
    );
  }
}

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);
  @override
  State<ProfilePageWidget> createState() => _ProfilePagefulWidgetState();
}

class _ProfilePagefulWidgetState extends State<ProfilePageWidget> {
  String dropdownValue = 'Seleziona Sesso';
  int peso = 85;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Seleziona il tuo livello"),
        Container(
          height: 50,
        ),
        DropdownButton(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>[
            'Seleziona Sesso',
            'Maschio',
            'Femmina',
            'Non binario'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Selezione peso"),
                Peso(),
              ],
            ),
            Column(
              children: [
                const Text("Seleziona altezza"),
                altezza(),
              ],
            )
          ],
        ),
        Container(
          height: 150,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Dropout'),
              onPressed: () {
                //This allows to go back to the HomePage
                Navigator.pop(context);
              },
            ),


            ElevatedButton(
              child: Text('Home'),
              onPressed: () => _toHomePage(context),

            ),
            ElevatedButton(
              child: Text('Log out'),
              onPressed: () => _toLoginPage(context) ,
            ),
          ],
        )
      ],
    );
  } //build

} //ProfilePage

 void _toHomePage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then push the CalendarPage
    
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()), );
  }

void _toLoginPage(BuildContext context) async{
    //Unset the 'username' filed in SharedPreference 
    final sp = await SharedPreferences.getInstance();
    sp.remove('username');

    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()), );
  }

class Peso extends StatefulWidget {
  @override
  pesoState createState() => pesoState();
}

class pesoState extends State<Peso> {
  int peso = 80;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NumberPicker(
          value: peso,
          minValue: 50,
          maxValue: 150,
          onChanged: (value) => setState(() => peso = value),
        ),
        Text('Current value: $peso Kg'),
      ],
    );
  }
}

class altezza extends StatefulWidget {
  @override
  altezzaState createState() => altezzaState();
}

class altezzaState extends State<altezza> {
  int altezza = 180;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NumberPicker(
          value: altezza,
          minValue: 100,
          maxValue: 250,
          onChanged: (value) => setState(() => altezza = value),
        ),
        Text('Current value: $altezza cm'),
      ],
    );
  }
}
