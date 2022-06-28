import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/database/database.dart';
import 'package:flexj/repository/databaseRepository.dart';
import 'package:flexj/screens/heart.dart';
import 'package:flexj/screens/home.dart';
import 'package:flexj/screens/homepage.dart';
import 'package:flexj/screens/pickvalue.dart';
import 'package:flexj/screens/profilepage.dart';
import 'package:flexj/screens/sleep.dart';
import 'package:flexj/screens/steps.dart';
import 'package:flexj/utils/fitData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// We modified the main
Future<void> main() async {
  //This is a special method that use WidgetFlutterBinding to interact with the Flutter engine.
  //This is needed when you need to interact with the native core of the app.
  //Here, we need it since when need to initialize the DB before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  //This opens the database.
  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //This creates a new DatabaseRepository from the AppDatabase instance just initialized
  final databaseRepository = DatabaseRepository(database: database);

  //Here, we run the app and we provide to the whole widget tree the instance of the DatabaseRepository.
  //That instance will be then shared through the platform and will be unique.
  runApp(ChangeNotifierProvider<DatabaseRepository>(
    create: (context) => databaseRepository,
    child: MyApp(),
  ));
} //main //main

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);
    @override
   Widget build(BuildContext context) {
      return ChangeNotifierProvider<FetchedFitData>(
        create: (context) => FetchedFitData(),
        child: 
    
    
    
    
        MaterialApp(
        //This specifies the app entrypoint
          initialRoute: HomePage.route,
          //This maps names to the set of routes within the app
          routes: {
            HomePage.route: (context) => newhome(),
            '/profile/': (context) => ProfilePage(),
            '/pickValue/': (context) => PickValuePage(),
            '/steps/': (context) => steps(),
            '/sleep/': (context) => sleep(),
            '/heart/': (context) => hf(),

          },

           onGenerateRoute: (settings) {
          if (settings.name == HomePage.route) {
            return MaterialPageRoute(builder: (context) {
              return HomePage();
            });
          } else if (settings.name == steps) {
            final args = settings.arguments as Map;
            return MaterialPageRoute(builder: (context) {
              return MealPage(
                  mealIndex: args['mealIndex'], mealDB: args['mealDB']);
            }); } else if (settings.name == sleep) {
            final args = settings.arguments as Map;
            return MaterialPageRoute(builder: (context) {
              return MealPage(
                  mealIndex: args['mealIndex'], mealDB: args['mealDB']);
            }); } else if (settings.name == MealPage.route) {
            final args = settings.arguments as Map;
            return MaterialPageRoute(builder: (context) {
              return MealPage(
                  mealIndex: args['mealIndex'], mealDB: args['mealDB']);
            });
          } else {
            return null;
          } //if-else
        },

        ),
      );
    } //build
  } //MyApp
