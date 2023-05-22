import 'package:flutter/cupertino.dart';
import 'package:pokedex_challenge/application/modules/main_module.dart';
import 'package:stream_value/core/stream_value.dart';

class InitScreenController {
  // final AuthRepositoryContract _authRepository = Inject.get<AuthRepositoryContract>()!;

  StreamValue<String> loadingStatusStreamValue =
      StreamValue<String>(defaultValue: "Carregando");

  String get initialRoute => _getInitialRoute();

  Future<void> initialize() async {
    loadingStatusStreamValue.addValue("É bom te ver por aqui!");
  }

  void gotoInitialRoute(BuildContext context) =>
      Navigator.pushReplacementNamed(context, initialRoute);

  String _getInitialRoute() {
    return MainModule.routePaths.init;
  }
}
