import 'dart:convert';

List<PaisEquipos> paisEquiposFromJson(String str) => List<PaisEquipos>.from(
    json.decode(str).map((x) => PaisEquipos.fromJson(x)));

String paisEquiposToJson(List<PaisEquipos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaisEquipos {
  PaisEquipos({
    this.id,
    this.name,
    this.pais,
    this.fundado,
    this.logo,
    this.nacional,
    this.v,
  });

  String id;
  String name;
  String pais;
  String fundado;
  String logo;
  bool nacional;
  int v;

  factory PaisEquipos.fromJson(Map<String, dynamic> json) => PaisEquipos(
        id: json["_id"],
        name: json["name"],
        pais: json["pais"],
        fundado: json["fundado"],
        logo: json["logo"],
        nacional: json["nacional"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "pais": pais,
        "fundado": fundado,
        "logo": logo,
        "nacional": nacional,
        "__v": v,
      };
}
