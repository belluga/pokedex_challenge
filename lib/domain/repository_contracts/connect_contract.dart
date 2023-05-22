import 'package:pokedex_challenge/domain/dto/pokemon_dto.dart';
import 'package:pokedex_challenge/domain/dto/pokemon_summary_dto.dart';

abstract class ConnectContract {
  Future<List<PokemonSummaryDTO>?> getAll();
  Future<PokemonDTO?> getSpecific(String slug);
}
