import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_test/models/favorites.dart';
import 'package:proyecto_test/screens/home.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
  create: (context) => Favorites(),
  child: MaterialApp(
    home: HomePage(),
  ),
);

void main() {
  group('Prueba Widget', () {
    testWidgets('Prueba 1', (WidgetTester tester) async {

      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);

    });

    testWidgets('Testing 2', (WidgetTester tester) async {

      await tester.pumpWidget(createHomeScreen());
      // existencia de icono

      // no existe
      expect(find.byIcon(Icons.favorite), findsNothing);
      // existe
      expect(find.byIcon(Icons.favorite_border), findsWidgets);

      // ejemplo de busqueda texto
      expect(find.text('Ejemplo Test'), findsWidgets);

      // ejemplo al darle tab al boton
      // evento para darle tab al boton
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      // evento duracion para mostrar mensaje
      await tester.pumpAndSettle(Duration(seconds: 1));
      // ya existe este mensaje
      expect(find.text('Agregado a favoritos.'), findsOneWidget);
      // ya existe el icono
      expect(find.byIcon(Icons.favorite), findsWidgets);

    });

  });
}