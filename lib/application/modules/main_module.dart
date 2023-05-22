import 'package:pokedex_challenge/domain/controllers_ccntracts/pokemon_list_page_controller_contract.dart';
import 'package:pokedex_challenge/domain/controllers_ccntracts/pokemon_single_page_controller.dart';
import 'package:pokedex_challenge/domain/navigation_arguments/pokemon_single_page_arguments.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:pokedex_challenge/presentation/main/controllers/pokemon_list_page_controller.dart';
import 'package:pokedex_challenge/presentation/main/controllers/pokemon_single_page_controller.dart';
import 'package:pokedex_challenge/presentation/main/pokemon_list_page.dart';
import 'package:pokedex_challenge/presentation/main/pokemon_single_page.dart';

class MainModule extends Module {
  @override
  String get path => routePaths.path;

  static final routePaths = _RouteNames();

  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(
          path: routePaths.init,
          builder: (_) => PokemonListPage(),
          transitionType: RouteTransitionType.downToUp,
        ),
        ModuleRoute(
          path: routePaths.single,
          builder: (_) => const PokemonSinglePage(),
          transitionType: RouteTransitionType.rightToLeftWithFade,
        ),
      ];

  @override
  List<Injector> get injections => [
        Injector<PokemonListPageControllerContract>(
          inject: (arguments) => PokemonListPageController(),
        ),
        Injector<PokemonSinglePageControllerContract>(
          inject: (arguments) => PokemonSinglePageController(
            pokemonID: (arguments as PokemonSinglePageArguments).pokemonID,
          ),
        ),
      ];
}

class _RouteNames {
  String get path => "main";
  String get single => "single";
  String get init => path;
}
