import 'dart:convert';
import 'package:apuestas_app/common/debouncer.dart';
import 'package:apuestas_app/data/repository/store_impl.dart';
import 'package:apuestas_app/data/repository/store_repository.dart';
import 'package:apuestas_app/models/data_ligas.dart';
import 'package:apuestas_app/models/fixture.dart';
import 'package:apuestas_app/models/usuario.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const keyLiga = 'ligas';

class HomeBloc extends ChangeNotifier {
  final debouncer = Debouncer();
  bool loading = false;
  bool listarligas = true;
  final StoreRepository storage = StoreImpl();
  TabController tabController;
  ScrollController scrollViewController;
  List<Usuario> usuario = [];
  List<DataLigas> ligas = [];
  List<Fixture> fixtures = [];
  List<Tab> tabs = [
    Tab(
      icon: Icon(Icons.home_outlined),
    ),
    Tab(
      child: Text('Deportes'),
    ),
    Tab(
      child: Text('Apuestas en vivo'),
    ),
    Tab(
      child: Text('Promociones'),
    ),
    Tab(
      child: Text('Deportes Virtuales'),
    ),
    Tab(
      child: Text('Blog'),
    ),
  ];
  String errorMessage = '';

  void onTapLiga(liga) {
    if (liga.isNotEmpty) addFixture(liga);
  }

  void onSearch() {
    if (listarligas) requestSearch();
  }

  void requestSearch() async {
    loading = true;
    notifyListeners();
    try {
      final url = Uri.https('api-apuestas.herokuapp.com', 'paisliga/list');
      final response = await http.get(url);
      print('xd');
      print(response.statusCode); //Response status code (200)
      print(response.body);

      final data = jsonDecode(response.body) as List;
      ligas = data.map((e) => DataLigas.fromJson(e)).toList();

      listarligas = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      print('xd');
    }
  }

  void addFixture(String liga) async {
    loading = true;
    notifyListeners();
    try {
      final url = Uri.https('api-apuestas.herokuapp.com', 'fixture/list/$liga');
      final response = await http.get(url);
      print('xd');
      print(response.statusCode); //Response status code (200)
      print(response.body);

      final data = jsonDecode(response.body) as List;

      loading = false;

      fixtures = data.map((e) => Fixture.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
      print('xd');
    }
  }

  /*
  void ligaList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(keyLiga);

    if (list != null && list.isNotEmpty) {
      ligas = list.map((e) => Liga.fromJson(json.decode(e))).toList();
      print('existe');
    } else {
      print('vacio');
    }

    notifyListeners();

    try {
      final url = Uri.https('api-apuestas.herokuapp.com', 'liga/list');
      final response = await http.get(url);
      final data = json.decode(response.body) as List;
      print(json.decode(response.body) as List);
      final etc = data.map((e) => Liga.fromJson(e)).toList();
      print(etc[0].codigoLiga);
      //liga = etc.map((e) => Liga.fromJson(e)).toList();
      print(response.statusCode); //Response status code (200)
      print(response.body);
      print(etc.length);

      for (int i = 0; i < etc.length; i++) {
        for (Liga item in ligas) {
          if (item.codigoLiga == etc[i].codigoLiga) {
            throw Exception('Liga ya existe');
          }
        }
        ligas.add(etc[i]);
        print('xd');
        prefs.setStringList(
          keyLiga,
          ligas.map((e) => jsonEncode(e.toJson())).toList(),
        );
      }

      //final data = jsonDecode(response.body) as List;

      //usuario = data.map((e) => Usuario.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }*/
}
