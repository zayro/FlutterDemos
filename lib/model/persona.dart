class Persona {
  int id;
  String nombre;
  String apellido;

  Persona({
    this.id,
    this.nombre,
    this.apellido,
  });

  factory Persona.fromJson(Map<String, dynamic> json) => Persona(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
      };
}
