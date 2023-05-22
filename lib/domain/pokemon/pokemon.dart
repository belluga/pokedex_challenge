import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex_challenge/domain/dto/pokemon_dto.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon_summary.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon_types.dart';

class Pokemon extends PokemonSummary {
  final List<PokemonTypes> types;
  final Decimal weight;
  final Decimal height;

  Pokemon({
    required super.id,
    required super.name,
    required this.height,
    required this.weight,
    required this.types,
  });

  Color get mainColor => Pokemon.colorByType(types.first);

  static Color colorByType(PokemonTypes type) {
    switch (type) {
      case PokemonTypes.normal:
        return const Color.fromRGBO(170, 166, 127, 1);
      case PokemonTypes.fighting:
        return const Color.fromRGBO(193, 34, 57, 1);
      case PokemonTypes.flying:
        return const Color.fromRGBO(168, 145, 236, 1);
      case PokemonTypes.ground:
        return const Color.fromRGBO(222, 193, 107, 1);
      case PokemonTypes.poison:
        return const Color.fromRGBO(164, 62, 158, 1);
      case PokemonTypes.rock:
        return const Color.fromRGBO(182, 158, 49, 1);
      case PokemonTypes.bug:
        return const Color.fromRGBO(167, 183, 35, 1);
      case PokemonTypes.ghost:
        return const Color.fromRGBO(112, 85, 155, 1);
      case PokemonTypes.steel:
        return const Color.fromRGBO(183, 185, 208, 1);
      case PokemonTypes.fire:
        return const Color.fromRGBO(245, 125, 49, 1);
      case PokemonTypes.water:
        return const Color.fromRGBO(100, 147, 235, 1);
      case PokemonTypes.grass:
        return const Color.fromRGBO(116, 203, 72, 1);
      case PokemonTypes.electric:
        return const Color.fromRGBO(249, 207, 48, 1);
      case PokemonTypes.psychic:
        return const Color.fromRGBO(251, 85, 132, 1);
      case PokemonTypes.ice:
        return const Color.fromRGBO(154, 214, 223, 1);
      case PokemonTypes.dragon:
        return const Color.fromRGBO(112, 55, 255, 1);
      case PokemonTypes.dark:
        return const Color.fromRGBO(117, 87, 76, 1);
      case PokemonTypes.fairy:
        return const Color.fromRGBO(230, 158, 172, 1);
      default:
        return const Color.fromRGBO(102, 102, 102, 1);
    }
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      Pokemon.fromDTO(PokemonDTO.fromJson(json));

  factory Pokemon.fromDTO(PokemonDTO dto) {
    return Pokemon(
      id: dto.id,
      name: dto.name,
      weight: (Decimal.fromInt(dto.weight) / Decimal.fromInt(10)).toDecimal(),
      height: (Decimal.fromInt(dto.height) / Decimal.fromInt(10)).toDecimal(),
      types: dto.types
          .map(
            (e) => PokemonTypes.values.firstWhere(
              (value) => value.name == e,
            ),
          )
          .toList(),
    );
  }
}
