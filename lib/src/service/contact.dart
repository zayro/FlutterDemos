//import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/services.dart';

class ContactProvider {
  ContactProvider();

  void loadContact() {
    rootBundle
        .loadString('assets/data/contactos.json')
        .then((value) => {print(value)});
  }

  List<dynamic> info = [];

  Future<List<dynamic>> remoteContact() async {
    final resp = await rootBundle.loadString('assets/data/contactos.json');
    Map mapData = json.decode(resp);
    info = mapData['contactos'];
    return info;
  }
}

final contactProvider = ContactProvider();
