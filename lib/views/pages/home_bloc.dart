import 'dart:convert';
import 'package:apuestas_app/data/repository/store_impl.dart';
import 'package:apuestas_app/data/repository/store_repository.dart';
import 'package:apuestas_app/models/usuario.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeBloc extends ChangeNotifier {
  final StoreRepository storage = StoreImpl();
  TabController tabController;
  ScrollController scrollViewController;
  List<Usuario> usuario = [];
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

  void onChangedText() {
    requestSearch();
  }

  void requestSearch() async {
    notifyListeners();
    try {
      final url = Uri.https('apuestas-api.herokuapp.com', 'liga');
      final response = await http.get(url);
      print('xd');
      print(response.statusCode); //Response status code (200)
      print(response.body);

      final data = jsonDecode(response.body) as List;

      usuario = data.map((e) => Usuario.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
      print('xd');
    }
  }
}
