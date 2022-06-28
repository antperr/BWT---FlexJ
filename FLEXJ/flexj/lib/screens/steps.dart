import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/utils/fitData.dart';
import 'package:flexj/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepsPage extends StatelessWidget {
  const StepsPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'StepPage';


  @override
  Widget build(BuildContext context) {
    
    
    
    
    
    
    double obiettivoPassi = 8000;
    double stepsnow = 0;
    double counter = stepsnow * 0.60;
    double peso = 80;
    double cal = 0.5 * peso * counter / 1000;
    double passiPercent = stepsnow / obiettivoPassi * 100;
    if (passiPercent > 100) {
      passiPercent = 100;
    }

    return Scaffold(
       
       appBar: AppBar(

          title: Text(StepsPage.routename),

          actions: [
            Consumer<FetchedFitData>(
              
              builder: (context, data, child) {

                return IconButton( onPressed: (){ 

                    data.getSteps();
                   },

                   icon: Icon(MdiIcons.chiliHot),
                );
                
              },)

          ],
       ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Consumer<FetchedFitData>(
                builder: (context, passiora, child) => Text('dude u made ${passiora.passi}')),//stepsnow=passiora.passi,)




            ],
          )
        )
    );
  }

             /*  CircularStepProgressIndicator(
                totalSteps: obiettivoPassi,
                currentStep: passiDay,
                stepSize: 10,
                selectedColor: Colors.red,
                unselectedColor: Colors.black,
                padding: 0,
                width: 250,
                height: 250,
                selectedStepSize: 15,
              ),
              Text(
                "$passiPercent %",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 80),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_fire_department),
                      Text("Calories= $cal kcal")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.directions_walk), Text("$counter m")],
                  )
                ],
              ),
             
            ]))); 
  }
}
*/

}
