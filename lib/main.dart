import 'package:flutter/material.dart';
import 'package:pokedex_challenge/application/application.dart';
import 'package:pokedex_challenge/application/pokedex_app.dart';

Future<void> main() async {
  final PokedexApp pokedexApp = PokedexApp();
  await pokedexApp.initialize();

  runApp(
    getMainWidget(pokedexApp),
  );
}

Widget getMainWidget(PokedexApp bellugaApp) {
  return Application();
}
