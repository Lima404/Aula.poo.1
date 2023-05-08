import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


// receita 6

class DataService {
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);
  var chaves = ["name", "style", "ibu"];
  var colunas = ["Nome", "Estilo", "IBU"];

  void carregar(index) {
    var carregadores = [
      carregarCafe,
      carregarCervejas,
      carregarNacoes,
    ];

    carregadores[index]();
  }

  void PropCervejas() {
    chaves = ["name", "style", "ibu"];
    colunas = ["Nome", "Estilo", "IBU"];
  }

  void PropCafes() {
    chaves = ["name", "intensidade", "nacionalidade"];
    colunas = ["Nome", "Intensidade", "Nacionalidade"];
  }

  void PropNacoes() {
    chaves = ["name", "moeda", "habitantes"];
    colunas = ["Nome", "Moeda", "Habitantes"];
  }

  void carregarCervejas() {
    PropCervejas();

    tableStateNotifier.value = [
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "Duvel", "style": "Pilsner", "ibu": "82"}
    ];
  }

  void carregarCafe() {
    PropCafes();

    tableStateNotifier.value = [
      {"name": "Café Puro", "intensidade": "10", "nacionalidade": "Brasileiro"},
      {"name": "Café Puro", "intensidade": "10", "nacionalidade": "Brasileiro"},
      {"name": "Café Puro", "intensidade": "10", "nacionalidade": "Brasileiro"}
    ];
  }

  void carregarNacoes() {
    PropNacoes();

    tableStateNotifier.value = [
      {"name": "Brasil", "moeda": "Real", "habitantes": "207kk"},
      {"name": "Brasil", "moeda": "Real", "habitantes": "207kk"},
      {"name": "Brasil", "moeda": "Real", "habitantes": "207kk"}
    ];
  }
}

final dataService = DataService();

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return DataTableWidget(
                  jsonObjects: value,
                  propertyNames: dataService.chaves,
                  columnNames: dataService.colunas,
                );
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  var itemSelectedCallback; //esse atributo será uma função

  NewNavBar({this.itemSelectedCallback}) {
    itemSelectedCallback ??= (_) {};
  }

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;
          itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;

  DataTableWidget(
      {this.jsonObjects = const [],
      this.columnNames = const ["Nome", "Estilo", "IBU"],
      this.propertyNames = const ["name", "style", "ibu"]});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}
