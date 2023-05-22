import 'package:pokedex_challenge/domain/dto/pokemon_summary_dto.dart';

class PokemonSummary {
  final int id;
  final String name;

  PokemonSummary({
    required this.id,
    required this.name,
  });

  String get idWithLeadingZeros => id.toString().padLeft(3, '0');
  String get pokemonImageURL => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/$id.png";
  String get pokemonSvgURL => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$id.svg";

  factory PokemonSummary.fromJson(Map<String, dynamic> json) =>
      PokemonSummary.fromDTO(PokemonSummaryDTO.fromJson(json));

  factory PokemonSummary.fromDTO(PokemonSummaryDTO dto) {
    return PokemonSummary(
      id: dto.id,
      name: dto.name,
    );
  }
}
