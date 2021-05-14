import 'dart:convert';
import 'package:apuestas_app/data/repository/store_repository.dart';
import 'package:apuestas_app/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

const keyUsuario = 'usuario';

class StoreImpl extends StoreRepository {
  @override
  Future<List<Usuario>> getUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final list = prefs.getStringList(keyUsuario);
    if (list != null && list.isNotEmpty) {
      final usuario = list
          .map(
            (e) => Usuario.fromJson(
              jsonDecode(e),
            ),
          )
          .toList();
      return usuario;
    }
    return <Usuario>[];
  }

  @override
  Future<void> saveUsuario(Usuario usuario) async {
    final list = await getUsuario();
    for (Usuario item in list) {
      if (item.correo == usuario.correo) {
        throw Exception('Ya existe este usuario');
      } else {
        throw Exception('No existe');
      }
    }
    list.add(usuario);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      keyUsuario,
      list.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }
}
