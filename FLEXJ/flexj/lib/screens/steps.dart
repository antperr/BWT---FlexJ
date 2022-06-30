import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/screens/home.dart';
import 'package:flexj/utils/dati.dart';
import 'package:flexj/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepsPage extends StatelessWidget {
  const StepsPage({Key? key}) : super(key: key);

  static const route = '/steps/';
  static const routename = 'StepsPage';


  @override
  Widget build(BuildContext context) {

    double obiettivoPassi = 18000;
    int stepsnow = 0;
    double counter = stepsnow * 0.60;
    double peso = 80;
    double cal = 0.5 * peso * counter / 1000;
    double passiPercent = stepsnow / obiettivoPassi * 100;
    if (passiPercent > 100) {
      passiPercent = 100;
    }

    return Scaffold(
       appBar: AppBar(
          title: Text(StepsPage.routename),
          actions: [
            Consumer<StepTizio>(
              builder: (context, data, child) {


                return IconButton( onPressed: () async { 

                  String? userId = await FitbitConnector.authorize( 
                      context: context, 
                      clientID: Strings.fitbitClientID, 
                      clientSecret: Strings.fitbitClientSecret, 
                      redirectUri: Strings.fitbitRedirectUri, 
                      callbackUrlScheme: Strings.fitbitCallbackScheme); 

                    data.getSteps();
                   
                }, 
                   icon: Icon(MdiIcons.chiliHot),
                );
              }
            )
          ],
       ),
        body: Center(
          child:
             Consumer<StepTizio>(
                builder: (context, passi, child){

                return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                    
                CircularStepProgressIndicator(
                                    
                                    totalSteps: obiettivoPassi.toInt(),
                                    currentStep: passi.steps,
                                    stepSize: 10,
                                    selectedColor: Colors.red,
                                    unselectedColor: Colors.black,
                                    padding: 0,
                                    width: 250,
                                    height: 250,
                                    selectedStepSize: 15,
                                  ),

                ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () => _toHomePage(context),
                      child: Text("To Home")),

                          ]
                );             
            }
        )
                )
    ); 
 }
}          

            

void _toHomePage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then push the ProfilePage
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()), );
  }