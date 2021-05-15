import 'package:apuestas_app/models/liga.dart';

class DataLigas {
  final String nombre;
  final List<Liga> ligas;

  DataLigas({
    this.nombre,
    this.ligas,
  });

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "ligas": ligas.map((e) => e.toJson()).toList(),
      };

  factory DataLigas.fromJson(Map<String, dynamic> map) {
    final myLigas = map['ligas'];
    return DataLigas(
      nombre: map['nombre'],
      ligas: myLigas != null
          ? (myLigas as List).map((e) => Liga.fromJson(e)).toList()
          : null,
    );
  }

  DataLigas fromLigas(List<Liga> ligas) {
    return DataLigas(
      nombre: nombre,
      ligas: ligas,
    );
  }
}
