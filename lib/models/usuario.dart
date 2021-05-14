class Usuario {
  final BigInt usuarioid;
  final String usuario;
  final String password;
  final String nombres;
  final String apellidos;
  final String correo;
  final String direccion;
  final int paisID;
  final int departamentoID;
  final int provinciaID;
  final int distritoID;
  final String codigopostal;
  final int tipomonedaID;
  final String telefonomovil;
  final String fechanacimiento;
  final String sexo;
  final int presupuestoID;
  final bool estado;

  Usuario({
    this.usuarioid,
    this.usuario,
    this.password,
    this.nombres,
    this.apellidos,
    this.correo,
    this.direccion,
    this.paisID,
    this.departamentoID,
    this.provinciaID,
    this.distritoID,
    this.codigopostal,
    this.tipomonedaID,
    this.telefonomovil,
    this.fechanacimiento,
    this.sexo,
    this.presupuestoID,
    this.estado,
  });

  Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "password": password,
        "nombres": nombres,
        "apellidos": apellidos,
        "correo": correo,
        "direccion": direccion,
        "paisID": paisID,
        "departamentoID": departamentoID,
        "provinciaID": provinciaID,
        "distritoID": distritoID,
        "codigopostal": codigopostal,
        "tipomonedaID": tipomonedaID,
        "telefonomovil": telefonomovil,
        "fechanacimiento": fechanacimiento,
        "sexo": sexo,
        "presupuestoID": presupuestoID,
        "estado": estado,
      };

  factory Usuario.fromJson(Map<String, dynamic> map) {
    return Usuario(
      usuario: map['usuario'],
      password: map['password'],
      nombres: map['nombres'],
      apellidos: map['apellidos'],
      correo: map['correo'],
      direccion: map['direccion'],
      paisID: map['paisID'],
      departamentoID: map['departamentoID'],
      provinciaID: map['provinciaID'],
      distritoID: map['distritoID'],
      codigopostal: map['codigopostal'],
      tipomonedaID: map['tipomonedaID'],
      telefonomovil: map['telefonomovil'],
      fechanacimiento: map['fechanacimiento'],
      sexo: map['sexo'],
      presupuestoID: map['presupuestoID'],
      estado: map['estado'],
    );
  }
}
