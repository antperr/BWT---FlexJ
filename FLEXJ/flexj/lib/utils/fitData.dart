
import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/utils/strings.dart';
import 'package:flutter/cupertino.dart';

class FetchedFitData{

  double? passi;
  double? peso;
  double? altezza;
  double? goal;

  FetchedFitData({required this.altezza, required this.goal, required this.passi, required this.peso});

  FetchedFitData.withstep({this.passi});
  FetchedFitData.withWeight({this.peso});
  FetchedFitData.withHeight({this.altezza});
  FetchedFitData.withGoal({this.goal});

}

class FFDTizio extends ChangeNotifier{

  FetchedFitData? Tizio;

  void getSteps(FetchedFitData toAdd){
    data.add(toAdd);
    notifyListeners();
  }

}
/* 
void getSteps(){
    passi= fetchSteps() as double?;
    notifyListeners();
  }
 */

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
      var stepsData = await fitbitActivityTimeseriesDataManager.fetch(
                FitbitActivityTimeseriesAPIURL.dayWithResource(
                    date: DateTime.now().subtract(Duration(days: 0)),
                    userID: userId,
                    resource: fitbitActivityTimeseriesDataManager.type,
                    )
      ) as List<FitbitActivityTimeseriesData>;

      

      steps=stepsData.last.value?.toDouble();

      return steps;
    }