
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