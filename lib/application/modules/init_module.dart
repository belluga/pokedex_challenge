import 'package:pokedex_challenge/presentation/init_screen/controller/init_screen_controller.dart';
import 'package:pokedex_challenge/presentation/init_screen/init_screen.dart';
import 'package:moduler_route/moduler_route.dart';

class InitModule extends Module {
  @override
  String get path => routePaths.path;

  static final routePaths = _RouteNames();

  @override
  bool get allowAnonymous => true;

  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(
          path: routePaths.init,
          builder: (_) => const InitScreen(),
          transitionType: RouteTransitionType.downToUp,
        ),
      ];

  @override
  List<Injector> get injections => [
        Injector<InitScreenController>(
          inject: (arguments) => InitScreenController(),
        ),
      ];
}

class _RouteNames {
  String get path => "init";
  String get init => path;
}
