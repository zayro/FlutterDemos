import 'package:flutter/material.dart';
import 'dart:convert';

class PersonModel {
  String nombre;
  String numero;
  String email;
  String password;

  Map jsonData;

  PersonModel() {
    this.nombre = 'Marlon Zayro';
    this.numero = '1020300';
    this.email = 'zayro8905@gmail.com';
    this.password = '123456';
  }

  Map<String, dynamic> toJson() => {
        'nombre': this.nombre,
        'numero': this.numero,
        'email': this.email,
        'password': this.password,
      };
}
