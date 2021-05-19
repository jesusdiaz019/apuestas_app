import 'dart:convert';

List<DataLigas> dataLigasFromJson(String str) =>
    List<DataLigas>.from(json.decode(str).map((x) => DataLigas.fromJson(x)));

String dataLigasToJson(List<DataLigas> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataLigas {
  DataLigas({
    this.id,
    this.pais,
    this.ligas,
    this.v,
  });

  String id;
  String pais;
  List<Ligas> ligas;
  int v;

  factory DataLigas.fromJson(Map<String, dynamic> json) => DataLigas(
        id: json["_id"],
        pais: json["pais"],
        ligas: List<Ligas>.from(json["ligas"].map((x) => Ligas.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "pais": pais,
        "ligas": List<dynamic>.from(ligas.map((x) => x.toJson())),
        "__v": v,
      };
}

class Ligas {
  Ligas({
    this.id,
    this.liga,
    this.tipoLiga,
    this.logo,
    this.fechaInicio,
    this.fechaFin,
    this.estado,
  });

  String id;
  String liga;
  String tipoLiga;
  String logo;
  DateTime fechaInicio;
  DateTime fechaFin;
  bool estado;

  factory Ligas.fromJson(Map<String, dynamic> json) => Ligas(
        id: json["_id"],
        liga: json["liga"],
        tipoLiga: json["tipo_liga"],
        logo: json["logo"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "liga": liga,
        "tipo_liga": tipoLiga,
        "logo": logo,
        "fecha_inicio": fechaInicio.toIso8601String(),
        "fecha_fin": fechaFin.toIso8601String(),
        "estado": estado,
      };
}
