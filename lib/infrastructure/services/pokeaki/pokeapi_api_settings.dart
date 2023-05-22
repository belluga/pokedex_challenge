import 'package:pokedex_challenge/domain/api_handler/api_settings_contract.dart';

class PokeapiAPISettings extends APISettingsContract {

  @override
  String get baseURL => "pokeapi.co";

  @override
  String get path => "/api/v2/";

  @override
  Map<String, String>? get header => null;
}
