import 'package:flutter/material.dart';
import 'package:pokedex_challenge/application/modules/main_module.dart';
import 'package:pokedex_challenge/domain/navigation_arguments/pokemon_single_page_arguments.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon_summary.dart';
import 'package:pokedex_challenge/presentation/main/widgets/pokemon_list_card/pokemon_id.dart';
import 'package:pokedex_challenge/presentation/main/widgets/pokemon_list_card/pokemon_name_tag.dart';

class PokemonListCard extends StatefulWidget {
  final PokemonSummary pokemon;

  const PokemonListCard({
    super.key,
    required this.pokemon,
  });

  @override
  State<PokemonListCard> createState() => _PokemonListCardState();
}

class _PokemonListCardState extends State<PokemonListCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _gotoSingle,
      child: Card(
        child: Column(
          children: [
            PokemonID(pokemon: widget.pokemon),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: SizedBox.shrink(),
                      ),
                      Expanded(
                        flex: 1,
                        child: PokemonNameTag(pokemon: widget.pokemon),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Image.network(
                      widget.pokemon.pokemonImageURL,
                      loadingBuilder: (_, widget, loading) {
                        if (loading != null) {
                          return const CircularProgressIndicator();
                        }

                        return widget;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _gotoSingle() {
    Navigator.of(context).pushNamed(
      MainModule.routePaths.single,
      arguments:
          PokemonSinglePageArguments(pokemonID: widget.pokemon.id.toString()),
    );
  }
}
