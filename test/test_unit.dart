import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_test/models/favorites.dart';

void main() {
  var favoritos = Favorites();

  group('Grupo pruebas', () {
    int numero = 1;

    test('Prueba 1', () {
      favoritos.add(numero);

      expect(favoritos.items.contains(1), true);
    });

    test('Prueba 1', () {
      favoritos.add(numero);

      expect(favoritos.items.contains(2), true);
    });

    test('Prueba 2', () {
      int numero = 2;

      favoritos.add(numero);
      expect(favoritos.items.contains(numero), true);

      favoritos.remove(numero);
      expect(favoritos.items.contains(numero), false);
    });
  });
}
