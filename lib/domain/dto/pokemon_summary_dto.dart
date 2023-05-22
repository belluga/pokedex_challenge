import 'package:flutter/cupertino.dart';

class PokemonSummaryDTO {
  final int id;
  final String name;

  PokemonSummaryDTO({
    required this.id,
    required this.name,
  });

  factory PokemonSummaryDTO.fromJson(Map<String, dynamic> json) {
    final int _pokemonID = parseId(json["url"] ?? "");

    return PokemonSummaryDTO(
      id: _pokemonID,
      name: json["name"],
    );
  }

  static int parseId(String url) {
    try {
      final _regexId =
          RegExp(r"https:\/\/pokeapi.co\/api\/v2\/pokemon\/([0-9]*)\/$");
      final String? _extractedID = _regexId.firstMatch(url)?.group(1);
      final int? _id = int.tryParse(_extractedID ?? "");
      return _id!;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Error extracting Pokemon ID from URL");
    }
  }

  static int? tryParseId(String url) {
    try {
      return parseId(url);
    } catch (e) {
      return null;
    }
  }
}
