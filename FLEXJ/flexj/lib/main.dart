import 'package:flexj/database/database.dart';
import 'package:flexj/repository/databaseRepository.dart';
import 'package:flexj/screens/home.dart';
import 'package:flexj/screens/login.dart';
import 'package:flexj/screens/profilepage.dart';
import 'package:flexj/screens/steps.dart';
import 'package:flexj/utils/dati.dart';
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
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<StepTizio>(

        create: (context) => StepTizio(),

        child: MaterialApp(
          //This specifies the app entrypoint
          initialRoute: LoginPage.route,
          //This maps names to the set of routes within the app
          routes: {
            HomePage.route: (context) => HomePage(),
            LoginPage.route: (context) => LoginPage(),
            StepsPage.route: (context) => StepsPage(),
            ProfilePage.route: (context) => ProfilePage(),
          },
        )
        );
        
        }
        
}
