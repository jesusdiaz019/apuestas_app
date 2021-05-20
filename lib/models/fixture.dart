import 'dart:convert';

List<Fixture> fixtureFromJson(String str) =>
    List<Fixture>.from(json.decode(str).map((x) => Fixture.fromJson(x)));

String fixtureToJson(List<Fixture> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fixture {
  Fixture({
    this.equipos,
    this.score,
    this.estado,
    this.id,
    this.liga,
    this.fecha,
    this.lugar,
    this.estadio,
    this.v,
  });

  Equipos equipos;
  Score score;
  Estado estado;
  String id;
  String liga;
  DateTime fecha;
  String lugar;
  String estadio;
  int v;

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        equipos: Equipos.fromJson(json["equipos"]),
        score: Score.fromJson(json["score"]),
        estado: Estado.fromJson(json["estado"]),
        id: json["_id"],
        liga: json["liga"],
        fecha: DateTime.parse(json["fecha"]),
        lugar: json["lugar"],
        estadio: json["estadio"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "equipos": equipos.toJson(),
        "score": score.toJson(),
        "estado": estado.toJson(),
        "_id": id,
        "liga": liga,
        "fecha": fecha.toIso8601String(),
        "lugar": lugar,
        "estadio": estadio,
        "__v": v,
      };
}

class Equipos {
  Equipos({
    this.local,
    this.visitante,
  });

  Local local;
  Local visitante;

  factory Equipos.fromJson(Map<String, dynamic> json) => Equipos(
        local: json["local"] == null ? null : Local.fromJson(json["local"]),
        visitante: json["visitante"] == null
            ? null
            : Local.fromJson(json["visitante"]),
      );

  Map<String, dynamic> toJson() => {
        "local": local == null ? null : local.toJson(),
        "visitante": visitante == null ? null : visitante.toJson(),
      };
}

class Local {
  Local({
    this.id,
    this.ganador,
  });

  String id;
  dynamic ganador;

  factory Local.fromJson(Map<String, dynamic> json) => Local(
        id: json["_id"],
        ganador: json["ganador"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ganador": ganador,
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
  dynamic tiempo;

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

  Equipos mediotiempo;
  Equipos tiempocompleto;
  Equipos tiempoextra;
  Equipos penales;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        mediotiempo: Equipos.fromJson(json["mediotiempo"]),
        tiempocompleto: Equipos.fromJson(json["tiempocompleto"]),
        tiempoextra: Equipos.fromJson(json["tiempoextra"]),
        penales: Equipos.fromJson(json["penales"]),
      );

  Map<String, dynamic> toJson() => {
        "mediotiempo": mediotiempo.toJson(),
        "tiempocompleto": tiempocompleto.toJson(),
        "tiempoextra": tiempoextra.toJson(),
        "penales": penales.toJson(),
      };
}
