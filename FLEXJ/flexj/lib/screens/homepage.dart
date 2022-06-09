import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flexj/models/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/strings.dart';



class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');


    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: ((context, snapshot) {
                if(snapshot.hasData){
                  final sp = snapshot.data as SharedPreferences;
                  if(sp.getInt('count') == null){
                    sp.setInt('count', 0);
                    return Text('Count = 0', style: TextStyle(fontSize: 25),);
                  }
                  else{
                    final count = sp.getInt('count')!;
                    return Text('Count = $count', style: TextStyle(fontSize: 25),);
                  }
                }
                else{
                  return CircularProgressIndicator();
                }
              }),
            ),

            ElevatedButton(onPressed: () => _addOne(), child: Text('Press to increment the counter')),
            ElevatedButton(onPressed: () => _removeCount(), child: Text('Press to remove count from SharedPreferences')),


            FutureBuilder(
              future: _fetchPost(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final post = snapshot.data as Post;
                  return Text('FETCHED POST: ${post.title}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),

            SizedBox(height: 100,),
            ElevatedButton(
                onPressed: () async {
                  await _createPost();
                },
                child: Text('Create a new post')),


            ElevatedButton(
              child: Text('To the profile'),
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage())); //Uncomment to see the "unnamed" approach
                Navigator.pushNamed(context, '/profile/'); //uncomment to see the "named" approach
              },
            ),
            ElevatedButton(
              child: Text('To the message'),
              onPressed: () {
                Navigator.pushNamed(context, '/message/', arguments: {'message': 'Hello!'}); 
              },
            ),
            ElevatedButton(
              child: Text('Pick a value'),
              onPressed: () async {
                //Get the result
                final result = await Navigator.pushNamed(context, '/pickValue/'); 
                // After the Selection Screen returns a result, hide any previous snackbars
                // and show the new result.
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text('$result')));

              },
            ),

            
              


            ElevatedButton(
              onPressed: () async {
                // Authorize the app
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
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'steps',
                );

                //Fetch data
                final stepsData = await fitbitActivityTimeseriesDataManager.fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                  date: DateTime.now().subtract(Duration(days: 2)),
                  userID: userId,
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;

                // Use them as you want
                final snackBar = SnackBar(
                    content: Text(
                        'Yesterday you walked ${stepsData[0].value} steps!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Tap to authorize'),
            ),



            ElevatedButton(
              onPressed: () async{

              String? userId = await FitbitConnector.authorize(
                    context: context,
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    redirectUri: Strings.fitbitRedirectUri,
                    callbackUrlScheme: Strings.fitbitCallbackScheme);



              FitbitHeartDataManager fitbitHeartDataManager = FitbitHeartDataManager(
                      clientID: Strings.fitbitClientID,
                      clientSecret: Strings.fitbitClientSecret,
                                       );

             FitbitHeartAPIURL fitbitHeartApiUrl = FitbitHeartAPIURL.dayWithUserID(
                                    date: DateTime.now(),
                                    userID: Strings.fitbitClientID,
                                  );

              FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'floors',
                );




                //Fetch data
                // final floors = await fitbitActivityTimeseriesDataManager.fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                //   date: DateTime.now().subtract(Duration(days: 2)),
                //   userID: userId,
                //   resource: fitbitActivityTimeseriesDataManager.type,
                // )) as List<FitbitActivityTimeseriesData>;


               List<FitbitHeartData> fitbitHeartData = (await fitbitHeartDataManager.fetch(fitbitHeartApiUrl)).cast<FitbitHeartData>();
              //  await fitbitHeartDataManager.fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
              //     date: DateTime.now().subtract(Duration(days: 2)),
              //     userID: userId,
              //     resource: fitbitActivityTimeseriesDataManager.type,
              //   ));
              
              
              }, child: Text('premi e vedi il cuore')),





            ElevatedButton(
              onPressed: () async {
                await FitbitConnector.unauthorize(
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,);
              },
              child: Text('Tap to unauthorize'),
            ),
          ],
        ),
      ),
    );
  } 
 //build

//This utility method allows to increment by 1 the value of count, and stores the new 'count' key-value into SharedPreferences
  void _addOne() async{
    final sp = await SharedPreferences.getInstance();
    setState(() {
      var count = sp.getInt('count');
      if(count != null){
        count++;
        sp.setInt('count', count);
      }
      
    });
  }//_addOne

  //This utility method allows to remove from the SharedPreferences the 'count' key-value pair.
  void _removeCount() async{
    final sp = await SharedPreferences.getInstance();
    sp.remove('count');
    setState(() {
      
    });
  }//_removeCount


  Future<Post?> _fetchPost(int id) async {
    final url = 'https://jsonplaceholder.typicode.com/posts/$id';
    final response = await http.get(Uri.parse(url));
    print(response.body);
    return response.statusCode == 200 ? Post.fromJson(jsonDecode(response.body)): null;
  } 
 //_fetchPost
  Future<Post?> _createPost() async {
    final url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'userId': 1,
          'title': 'test',
          'body': 'This is a test post',
        }));
    print(response.body);
    return response.statusCode == 200 ? Post.fromJson(jsonDecode(response.body)) : null;
  } } //HomePage