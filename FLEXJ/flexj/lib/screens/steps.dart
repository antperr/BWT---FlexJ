import 'dart:js';

import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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



FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'steps',
                );




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
                    context: ,
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
