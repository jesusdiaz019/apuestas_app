class Liga {
  final int codigoLiga;
  final String nombreLiga;
  final String tipoLiga;
  final String logo;
  final String pais;

  Liga({
    this.codigoLiga,
    this.nombreLiga,
    this.tipoLiga,
    this.logo,
    this.pais,
  });

  Map<String, dynamic> toJson() => {
        "CodigoLiga": codigoLiga,
        "Liga": nombreLiga,
        "TipoLiga": tipoLiga,
        "Logo": logo,
        "Pais": pais,
      };

  factory Liga.fromJson(Map<String, dynamic> map) {
    return Liga(
      codigoLiga: map['CodigoLiga'],
      nombreLiga: map['Liga'],
      tipoLiga: map['TipoLiga'],
      logo: map['Logo'],
      pais: map['Pais'],
    );
  }
}
