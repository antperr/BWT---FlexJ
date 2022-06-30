import 'package:flexj/screens/login.dart';
import 'package:flexj/screens/profilepage.dart';
import 'package:flexj/screens/steps.dart';
import 'package:flexj/utils/fitData.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/home/';
  static const routeDisplayName = 'HomePage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routeDisplayName} built');

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(HomePage.routeDisplayName),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                "Welcome to",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "FLEXJ",
                style: TextStyle(fontSize: 50, color: Colors.red),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () => _toStepPage(context),
                      child: Text("To Steps")),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () => _toProfilePage(context),
                      child: Text("Go to profile")),
                ],
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: ()=> _toLoginPage(context) ,
                  child: Text("LogOut"))
            ],
          ),
        ));
        
  }
}


void _toProfilePage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then push the ProfilePage
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()), );
  }//_toProfilePage


void _toLoginPage(BuildContext context) async{
    //Unset the 'username' filed in SharedPreference 
    final sp = await SharedPreferences.getInstance();
    sp.remove('username');
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()), );
  }


  void _toStepPage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then push the ProfilePage

    Navigator.push(context, MaterialPageRoute(builder: (context) => StepsPage()), );
  }