import 'package:flutter/material.dart';

class NewBody extends StatelessWidget {
  NewBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder.all(),
        children: [
          TableRow(children: [
            Container(
              color: Colors.pink,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                'Cerveja',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              color: Colors.pink,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                'Tamanho',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              color: Colors.pink,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                'Preço',
                style: TextStyle(color: Colors.white),
              ),
            )
          ]),
          TableRow(children: [
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                'Spaten',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                '600ml',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                'RS 5,50',
                style: TextStyle(color: Colors.black),
              ),
            )
          ]),
          ],
      ),
    );
  }
}

class NewAppBar extends StatelessWidget {
  NewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Center(
      child: Text("Teste de flutter"),
    ));
  }
}

class NewNavBar extends StatelessWidget {
  NewNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(MyIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(MyIcons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(MyIcons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}

class MyIcons {
  static IconData home = Icons.home;
  static IconData search = Icons.search;
  static IconData settings = Icons.settings;
  static IconData person = Icons.person;
  static IconData local_drink_outlined = Icons.local_drink_outlined;
  static IconData flag = Icons.flag;
  static IconData coffee = Icons.coffee;
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: Scaffold(
          appBar: AppBar(title: NewAppBar()),
          body: Center(
            child: Column(
              children: [
                NewBody()
              ],
            ),
          ),
          bottomNavigationBar: NewNavBar(),
        ));
  }
}

void main() {
  MyApp app = MyApp();

  runApp(app);
}