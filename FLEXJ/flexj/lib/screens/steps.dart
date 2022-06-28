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

    return Scaffold(
        backgroundColor: Colors.purple[200],
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularStepProgressIndicator(
                totalSteps: obiettivoPassi,
                currentStep: passiDay,
                stepSize: 10,
                selectedColor: Colors.white,
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
                      Text(
                        "Calories= $cal kcal",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_walk),
                      Text("$counter m", style: TextStyle(fontSize: 15))
                    ],
                  )
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () async {
                  //Instantiate a proper data manager
                  FitbitActivityTimeseriesDataManager
                      fitbitActivityTimeseriesDataManager =
                      FitbitActivityTimeseriesDataManager(
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    type: 'steps',
                  );

                  //Fetch data
                  final stepsDatatoday =
                      await fitbitActivityTimeseriesDataManager
                          .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                    date: DateTime.now().subtract(Duration(days: 0)),
                    userID: Strings.userId,
                    resource: fitbitActivityTimeseriesDataManager.type,
                  )) as List<FitbitActivityTimeseriesData>;

                  // Use them as you want
                  final snackBar = SnackBar(
                      content: Text(
                          'Yesterday you walked ${stepsDatatoday[0].value} steps!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('Fetch the data'),
              ),
            ]));
  }
}
