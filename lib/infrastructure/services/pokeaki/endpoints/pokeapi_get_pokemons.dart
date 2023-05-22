import 'package:pokedex_challenge/domain/api_handler/endpoint_settings_contract.dart';
import 'package:pokedex_challenge/domain/api_handler/endpoint_type.dart';

class PokeapiGetPokemons extends EndpointSettingsContract {
  @override
  final EndpointType type = EndpointType.get;

  @override
  final String node = 'pokemon';
}
