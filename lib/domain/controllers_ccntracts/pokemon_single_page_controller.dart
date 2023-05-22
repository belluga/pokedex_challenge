import 'package:moduler_route/moduler_route.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon_summary.dart';
import 'package:pokedex_challenge/domain/repository_contracts/pokemon_repository_contract.dart';
import 'package:stream_value/core/stream_value.dart';

abstract class PokemonSinglePageControllerContract {
  String get pokemonID;

  final itemRepository = Inject.get<PokemonRepositoryContract>()!;
  StreamValue<Pokemon?> get pokemonStreamValue;

  void dispose(){
    Inject.dispose<PokemonSinglePageControllerContract>();
  }
}
