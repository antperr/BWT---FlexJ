
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
<<<<<<< Updated upstream
  FetchedFitData.withhr({this.bpm});
  FetchedFitData.withtimehr({this.hr});
=======
  FetchedFitData.withWeight({this.peso});
  FetchedFitData.withHeight({this.altezza});
  FetchedFitData.withGoal({this.goal});
  FetchedFitData.withGender({this.genere});

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

    


>>>>>>> Stashed changes

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