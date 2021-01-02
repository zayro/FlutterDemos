import 'dart:ffi';

class Coordenadas {
  double latitud;
  double longitud;

  Coordenadas({
    this.latitud,
    this.longitud,
  });

  factory Coordenadas.fromJson(Map<String, dynamic> json) => Coordenadas(
        latitud: json["latitud"],
        longitud: json["longitud"],
      );

  Map<String, dynamic> toJson() => {
        "latitud": latitud,
        "longitud": longitud,
      };

  set latitudValue(double value) {
    this.latitud = value;
  }

  double get latitudValue {
    return this.latitud;
  }

  set longitudValue(double value) {
    this.longitud = value;
  }

  double get longitudValue {
    return this.longitud;
  }
}
