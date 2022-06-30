
import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/screens/home.dart';
import 'package:flexj/utils/strings.dart';
import 'package:flutter/cupertino.dart';


String UserId = '7ML2XV'; 


class StepTizio extends ChangeNotifier{
  int steps = 0;
  Future<int> getSteps() async{
    int? st= await fetchStep(UserId);
    steps=st as int;
    notifyListeners();
    return steps;
  }
}


Future<int?> fetchStep(UserId) async { 
  


  //Instantiate a proper data manager 
  FitbitActivityTimeseriesDataManager fitbitActivityTimeseriesDataManager = 
      FitbitActivityTimeseriesDataManager( 
    clientID: Strings.fitbitClientID, 
    clientSecret: Strings.fitbitClientSecret, 
    type: 'steps', 
  ); 
 
  //Fetch data 
  final stepsData = await fitbitActivityTimeseriesDataManager 
      .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource( 
    date: DateTime.now().subtract(Duration(days: 0)), 
    userID: UserId, 
    resource: fitbitActivityTimeseriesDataManager.type, 
  )) as List<FitbitActivityTimeseriesData>; 
 
  return stepsData.last.value?.toInt(); 

}