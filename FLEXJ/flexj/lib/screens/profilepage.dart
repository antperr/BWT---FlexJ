import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  
  const ProfilePage({Key? key}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    print('${ProfilePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(ProfilePage.routename),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('To the home'),
          onPressed: () {
            //This allows to go back to the HomePage
            Navigator.pop(context);
          },
        ),
      ),
    );
  } //build

} //ProfilePage


drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Important: Remove any padding from the ListView.
              
              children: [
                // const DrawerHeader(
                //   decoration: BoxDecoration(
                //     color: Colors.purple,
                //   ),
                //   child: Text('Drawer Header'),
                // ),
                
                      Text(
                        "FLEXJ",
                        style: TextStyle(fontSize: 40),
                      )
                    ],
                  ),
                ),
ListView(child:
                Card(
                    shadowColor: Colors.purple,
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                      ),
                      trailing: const Icon(Icons.arrow_right),
                      title: const Text('Profile'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()));
                      },
                    )),

                Text("Nomeutente"),
                Text("mail"),
                Text("Peso"),
                Text("altezza"),
                Text("BMI"),
                
    );
  }
}
