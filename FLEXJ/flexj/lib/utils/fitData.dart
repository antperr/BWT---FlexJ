
import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/utils/strings.dart';
import 'package:flutter/cupertino.dart';

class FetchedFitData extends ChangeNotifier{

  double? passi;
  double? peso;
  double? altezza;
  double? goal;
  bool? genere;

  FetchedFitData({this.altezza, this.genere, this.goal, this.passi, this.peso});

  FetchedFitData.withstep({this.passi});
  FetchedFitData.withWeight({this.peso});
  FetchedFitData.withHeight({this.altezza});
  FetchedFitData.withGoal({this.goal});
  FetchedFitData.withGender({this.genere});

  void getSteps(){
    passi= fetchSteps() as double?;
  }

}





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