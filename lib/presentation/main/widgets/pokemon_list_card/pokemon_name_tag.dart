import 'package:flutter/material.dart';
import 'package:pokedex_challenge/application/common/style/pokedex_style.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon_summary.dart';

class PokemonNameTag extends StatelessWidget {

  final PokemonSummary pokemon;

  const PokemonNameTag({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: PokedexStyle.greyscale.light,
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    pokemon.name,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: PokedexStyle.greyscale.dark,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
