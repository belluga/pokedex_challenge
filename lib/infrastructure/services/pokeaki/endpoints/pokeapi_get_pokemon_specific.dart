import 'package:pokedex_challenge/domain/api_handler/endpoint_settings_contract.dart';
import 'package:pokedex_challenge/domain/api_handler/endpoint_type.dart';

class PokeapiGetPokemonSpecific extends EndpointSettingsContract {

  PokeapiGetPokemonSpecific({
    required this.pokemonID,
  });
  
  @override
  final EndpointType type = EndpointType.get;

  @override
  String get node => 'pokemon/$pokemonID';

  final String pokemonID;
}
