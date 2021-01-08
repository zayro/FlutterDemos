import 'dart:io'; // Server side / command line only package.

main() {
  Map<String, String> env = Platform.environment;
  env.forEach((k, v) => print("Key=$k Value=$v"));
}

class EnvironmentConfig {
  static const SOME_VAR = String.fromEnvironment('SOME_VAR');
  static const OTHER_VAR = String.fromEnvironment('OTHER_VAR');
}

/**
 * DECLARE ENVIROMENT
 */

// flutter run --dart-define=SOME_VAR=SOME_VALUE

//const SOME_VAR = String.fromEnvironment('SOME_VAR', defaultValue: 'SOME_DEFAULT_VALUE');

// const bool isProduction = bool.fromEnvironment('dart.vm.product');
