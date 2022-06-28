
import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/utils/strings.dart';
import 'package:flutter/cupertino.dart';

FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'steps',
                );







Future<double?> fetchSteps() async{

  double? steps=0;

  String? userId = await FitbitConnector.authorize(
                    context: ,
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    redirectUri: Strings.fitbitRedirectUri,
                    callbackUrlScheme: Strings.fitbitCallbackScheme);
                    
                //Instantiate a proper data manager
  FitbitActivityTimeseriesDataManager
        fitbitActivityTimeseriesDataManager =
        FitbitActivityTimeseriesDataManager(
            clientID: '<OAuth 2.0 Client ID>',
            clientSecret: '<Client Secret>',
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

  

  steps=stepsData.last.value;

  return steps;

}




class FetchedFitData extends ChangeNotifier{

  double? passi;
  // double? bpm;
  double? peso;
  double? altezza;
  double? goal;
  bool? genere;

  FetchedFitData();

  FetchedFitData.withstep({this.passi});
  FetchedFitData.withWeight({this.peso});
  FetchedFitData.withHeight({this.altezza});
  FetchedFitData.withGoal({this.goal});
  FetchedFitData.withGender({this.genere});

}




/*  fitData=FetchedFitData.withstep(passi: 10);
    fitData=FetchedFitData.withhr(bpm: 100);
    fitData=FetchedFitData.withtimehr(hr: hrData);
 */
