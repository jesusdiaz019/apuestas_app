import 'package:apuestas_app/models/usuario.dart';

abstract class StoreRepository {
  Future<void> saveUsuario(Usuario usuario);
  Future<List<Usuario>> getUsuario();
}
