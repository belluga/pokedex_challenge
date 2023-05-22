import 'package:pokedex_challenge/domain/dto/base_stats_dto.dart';
import 'package:pokedex_challenge/domain/dto/pokemon_summary_dto.dart';

class PokemonDTO extends PokemonSummaryDTO {
  final BaseStatsDTO baseStats;
  final List<String> types;
  final int weight;
  final int height;

  PokemonDTO({
    required super.id,
    required super.name,
    required this.weight,
    required this.height,
    required this.baseStats,
    required this.types,
  });

  factory PokemonDTO.fromJson(Map<String, dynamic> json) {
    return PokemonDTO(
      id: json["id"],
      name: json["name"],
      weight: json["weight"],
      height: json["height"],
      baseStats: BaseStatsDTO.fromJson(json["stats"]),
      types: PokemonDTO.parseTypes(json["types"]),
    );
  }

  static List<String> parseTypes(List list) {
    final List<Map<String, dynamic>> _mapList =
        list.map((e) => e as Map<String, dynamic>).toList();
    return _mapList.map((e) => e["type"]["name"] as String).toList();
  }
}
