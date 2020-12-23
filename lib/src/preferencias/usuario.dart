import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario();

  PreferenciasUsuario.internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get token {
    return this._prefs.getString("token");
  }

  set token(String valor) {
    this._prefs.setString("token", valor);
  }
}
