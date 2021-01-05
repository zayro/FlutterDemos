import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/index.dart';

import './providers/index.dart';

//void main() => runApp(MyApp());

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/home",
        routes: rootPath(),
        //home: FirstPage(),
      ),
    ),
  );
}
