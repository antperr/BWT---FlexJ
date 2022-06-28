import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sleep extends StatefulWidget {
  const sleep({Key? key}) : super(key: key);
  @override
  State<sleep> createState() => _sleepState();
}

class _sleepState extends State<sleep> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
              Colors.black,
              Colors.indigo,
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              height: 30,
            ),
            Text(
              "Andamento del sonno",
              style: TextStyle(
                  fontSize: 35, color: Color.fromARGB(255, 184, 176, 176)),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () async {
                // Authorize the app

                //Instantiate a proper data manager
                FitbitSleepDataManager fitbitSleepDataManager =
                    FitbitSleepDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                );

                //Fetch data
                final sleepData = await fitbitSleepDataManager
                    .fetch(FitbitSleepAPIURL.withUserIDAndDay(
                  date: DateTime.now().subtract(Duration(days: 1)),
                  userID: Strings.userId,
                )) as List<FitbitSleepData>;
              },
              child: Text('Fetch data'),
            ),
          ],
        ));
  }
}
