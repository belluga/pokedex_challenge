import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:pokedex_challenge/domain/controllers_ccntracts/pokemon_single_page_controller.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon.dart';
import 'package:stream_value/core/stream_value_builder.dart';

class PokemonSinglePage extends StatefulWidget {
  const PokemonSinglePage({super.key});

  @override
  State<PokemonSinglePage> createState() => _PokemonSinglePageState();
}

class _PokemonSinglePageState extends State<PokemonSinglePage> {
  final _controller = Inject.get<PokemonSinglePageControllerContract>()!;

  @override
  Widget build(BuildContext context) {
    return StreamValueBuilder<Pokemon>(
      streamValue: _controller.pokemonStreamValue,
      onNullWidget: const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      )),
      onErrorBuilder: (message) => Scaffold(
          body: Center(
        child: Row(children: [
          Expanded(
            child: Text(message),
          )
        ]),
      )),
      builder: (context, pokemon) {
        return Scaffold(
          backgroundColor: pokemon.mainColor,
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    const BackButton(),
                    Expanded(
                      child: Text(pokemon.name),
                    ),
                  ],
                ),
                Row(
                  children: List.generate(
                    pokemon.types.length,
                    (index) => Chip(
                      backgroundColor:
                          Pokemon.colorByType(pokemon.types[index]),
                      label: Text(
                        pokemon.types[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                          child: Text(
                              "weight: ${pokemon.weight.toStringAsFixed(1)} kg")),
                    ),
                    Expanded(
                      child: Center(
                          child: Text(
                              "height: ${pokemon.height.toStringAsFixed(1)} m")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
