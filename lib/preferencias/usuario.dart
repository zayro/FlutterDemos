import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsario {
  static final PreferenciasUsario _instancia =
      new PreferenciasUsario.internal();

  factory PreferenciasUsario() {
    return _instancia;
  }

  PreferenciasUsario.internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String valor) {
    _prefs.setString('token', valor);
  }

  /**
   * ULTIMA PAGINA
   */

  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina(String valor) {
    _prefs.setString('ultimaPagina', valor);
  }

  /**
   * CREDENCIALES LOGIN
   */

  get email {
    return _prefs.getString('email') ?? '';
  }

  set email(String valor) {
    _prefs.setString('email', valor);
  }

  get password {
    return _prefs.getString('password') ?? '';
  }

  set password(String valor) {
    _prefs.setString('password', valor);
  }

  get checkLogin {
    return _prefs.getBool('checkLogin') ?? false;
  }

  set checkLogin(bool valor) {
    _prefs.setBool('checkLogin', valor);
  }

  /**
   * Cerrar Sesion
   */
}
