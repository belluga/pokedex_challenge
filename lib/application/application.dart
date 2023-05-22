import 'package:pokedex_challenge/application/common/style/pokedex_style.dart';
import 'package:pokedex_challenge/application/modules/init_module.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_challenge/application/modules/main_module.dart';
import 'package:pokedex_challenge/domain/repository_contracts/global_repository_contract.dart';
import 'package:pokedex_challenge/domain/repository_contracts/pokemon_repository_contract.dart';
import 'package:pokedex_challenge/infrastructure/repositories/global_repository.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:pokedex_challenge/infrastructure/repositories/pokemon_repository.dart';

class Application extends StatelessWidget with Moduler {
  Application({super.key});

  final GlobalRepositoryContract globalRepository = GlobalRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalRepository.navigatorKey,
      theme: PokedexStyle.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute(() {
        return InitModule.routePaths.init;
      }),
      onGenerateRoute: routeTo,
      onUnknownRoute: unknownRoute,
      navigatorObservers: [modulerRouteObserver],
    );
  }

  @override
  List<Module> get modules => [
        InitModule(),
        MainModule(),
      ];

  @override
  List<Injector> get globalInjections => [
        Injector<GlobalRepositoryContract>(
          inject: (arguments) => globalRepository,
        ),
        Injector<PokemonRepositoryContract>(
          inject: (arguments) => PokemonRepository(),
        ),
      ];
}
