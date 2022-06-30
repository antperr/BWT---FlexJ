/* import 'dart:js';

import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/utils/strings.dart';

Future<double?> fetchSteps() async{

      double? steps=0;

      String? userId = await FitbitConnector.authorize(
                        context: context,
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
    } */