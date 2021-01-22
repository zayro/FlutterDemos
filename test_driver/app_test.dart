import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Pruebas de integración', () {
    FlutterDriver driver;

    // hace conexion  a la aplicacion
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // se desconecta de la aplicacion
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });  

    test('Prueba Scroll', () async {

      // se define el widget
      final listFinder = find.byType('ListView');

      // se ejecuta la operacion
      await driver.traceAction(() async {
        // activacion de scroll1
        await driver.scroll(listFinder, 0, -7000, Duration(seconds: 5));
        await driver.scroll(listFinder, 0, 7000, Duration(seconds: 5));
      });

    });

    test('Operacion favoritos', () async {

      // se ejecuta la operacion
      await driver.traceAction(() async {

        // arreglo de key iconos
        final iconKeys = [
          'icon_0',
          'icon_1',
          'icon_2',
        ];

        // se hace recorrido deel listado de iconos
        for (var icon in iconKeys) {
          // tap a boton agregar a favoritos
          await driver.tap(find.byValueKey(icon));
          // activacion del snackbar
          await driver.waitFor(find.text('Agregado a favoritos.'));
        }

        // tap a boton favoritos - pantalla favoritos
        await driver.tap(find.text('Favoritos'));

        // arreglo de key iconos
        final removeIconKeys = [
          'remove_icon_0',
          'remove_icon_1',
          'remove_icon_2',
        ];

        for (final iconKey in removeIconKeys) {
          await driver.tap(find.byValueKey(iconKey));
          await driver.waitFor(find.text('Removido de favoritos.'));
        }
      });

    });

  });
}