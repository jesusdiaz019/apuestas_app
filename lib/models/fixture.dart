import 'dart:convert';

List<Fixture> fixtureFromJson(String str) =>
    List<Fixture>.from(json.decode(str).map((x) => Fixture.fromJson(x)));

String fixtureToJson(List<Fixture> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fixture {
  Fixture({
    this.id,
    this.equipos,
    this.ligaId,
    this.fecha,
    this.lugar,
    this.estadio,
    this.score,
    this.estado,
  });

  String id;
  Equipos equipos;
  String ligaId;
  DateTime fecha;
  String lugar;
  String estadio;
  Score score;
  Estado estado;

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["_id"],
        equipos: Equipos.fromJson(json["equipos"]),
        ligaId: json["liga_id"],
        fecha: DateTime.parse(json["fecha"]),
        lugar: json["lugar"],
        estadio: json["estadio"],
        score: Score.fromJson(json["score"]),
        estado: Estado.fromJson(json["estado"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "equipos": equipos.toJson(),
        "liga_id": ligaId,
        "fecha": fecha.toIso8601String(),
        "lugar": lugar,
        "estadio": estadio,
        "score": score.toJson(),
        "estado": estado.toJson(),
      };
}

class Equipos {
  Equipos({
    this.local,
    this.visitante,
  });

  List<Local> local;
  List<Local> visitante;

  factory Equipos.fromJson(Map<String, dynamic> json) => Equipos(
        local: List<Local>.from(json["local"].map((x) => Local.fromJson(x))),
        visitante:
            List<Local>.from(json["visitante"].map((x) => Local.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "local": List<dynamic>.from(local.map((x) => x.toJson())),
        "visitante": List<dynamic>.from(visitante.map((x) => x.toJson())),
      };
}

class Local {
  Local({
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

  factory Local.fromJson(Map<String, dynamic> json) => Local(
        id: json["_id"],
        name: json["name"],
        pais: json["pais"],
        fundado: json["fundado"] == null ? null : json["fundado"],
        logo: json["logo"],
        nacional: json["nacional"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "pais": pais,
        "fundado": fundado == null ? null : fundado,
        "logo": logo,
        "nacional": nacional,
        "__v": v,
      };
}

class Estado {
  Estado({
    this.long,
    this.short,
    this.tiempo,
  });

  String long;
  String short;
  String tiempo;

  factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        long: json["long"],
        short: json["short"],
        tiempo: json["tiempo"],
      );

  Map<String, dynamic> toJson() => {
        "long": long,
        "short": short,
        "tiempo": tiempo,
      };
}

class Score {
  Score({
    this.mediotiempo,
    this.tiempocompleto,
    this.tiempoextra,
    this.penales,
  });

  Mediotiempo mediotiempo;
  Mediotiempo tiempocompleto;
  Mediotiempo tiempoextra;
  Mediotiempo penales;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        mediotiempo: Mediotiempo.fromJson(json["mediotiempo"]),
        tiempocompleto: Mediotiempo.fromJson(json["tiempocompleto"]),
        tiempoextra: Mediotiempo.fromJson(json["tiempoextra"]),
        penales: Mediotiempo.fromJson(json["penales"]),
      );

  Map<String, dynamic> toJson() => {
        "mediotiempo": mediotiempo.toJson(),
        "tiempocompleto": tiempocompleto.toJson(),
        "tiempoextra": tiempoextra.toJson(),
        "penales": penales.toJson(),
      };
}

class Mediotiempo {
  Mediotiempo({
    this.local,
    this.visitante,
  });

  String local;
  String visitante;

  factory Mediotiempo.fromJson(Map<String, dynamic> json) => Mediotiempo(
        local: json["local"] == null ? null : json["local"],
        visitante: json["visitante"] == null ? null : json["visitante"],
      );

  Map<String, dynamic> toJson() => {
        "local": local == null ? null : local,
        "visitante": visitante == null ? null : visitante,
      };
}
