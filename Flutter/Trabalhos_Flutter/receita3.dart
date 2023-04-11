import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Title'),
                ),
                ListTile(
                  title: const Text('Type one'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Type two'),
                  onTap: () {
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Bebidas"),
          ),
          body: DataBodyWidget(objects: [
            "Spaten",
            "Heineken ",
            "Budwiser",
            "Cachaça Rainha",
            
          ]),
          bottomNavigationBar: NewNavBar(
            icons: [
              Icons.person,
              Icons.add,
              Icons.home,
              Icons.access_alarm
            ],
          ),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  List<IconData> icons;

  NewNavBar({this.icons = const []});

  Expanded processarUmElementoIcon(IconData ic) {
    return Expanded(child: Icon(ic));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: icons
            .map((ic) => Expanded(
                  child: Icon(ic),
                ))
            .toList());
  }
}

//icon: Icon(Icons.coffee_outlined),

class DataBodyWidget extends StatelessWidget {
  List<String> objects;

  DataBodyWidget({this.objects = const []});

  Expanded processarUmElemento(String obj) {
    return Expanded(
      child: Center(child: Text(obj)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: objects
            .map((obj) => Expanded(
                  child: Center(child: Text(obj)),
                ))
            .toList());
  }
}