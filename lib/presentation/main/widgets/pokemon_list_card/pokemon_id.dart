import 'package:flutter/material.dart';
import 'package:pokedex_challenge/application/common/style/pokedex_style.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon_summary.dart';

class PokemonID extends StatelessWidget {

  final PokemonSummary pokemon;

  const PokemonID({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, top: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              "#${pokemon.idWithLeadingZeros}",
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: PokedexStyle.greyscale.medium,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
