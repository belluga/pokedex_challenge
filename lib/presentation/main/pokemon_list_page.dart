import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:pokedex_challenge/domain/controllers_ccntracts/pokemon_list_page_controller_contract.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon_summary.dart';
import 'package:pokedex_challenge/presentation/main/widgets/loading_more.dart';
import 'package:pokedex_challenge/presentation/main/widgets/pokemon_list_card/pokemon_list_card.dart';
import 'package:stream_value/core/stream_value_builder.dart';

class PokemonListPage extends StatelessWidget {
  final _controller = Inject.get<PokemonListPageControllerContract>()!;

  PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(),
            Text("Pokédex"),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [Expanded(child: Container()), CircleAvatar()],
          ),
          Expanded(
            child: StreamValueBuilder<List<PokemonSummary>>(
              streamValue: _controller.itemRepository.itemsStreamValue,
              onNullWidget: const Center(
                child: CircularProgressIndicator(),
              ),
              builder: (context, pokemons) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          spreadRadius: -2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            controller: _controller.listViewScrowController,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            itemBuilder: (context, index) =>
                                PokemonListCard(pokemon: pokemons[index]),
                            itemCount: pokemons.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                          ),
                        ),
                        LoadingMore(
                          loadingStreamValue:
                              _controller.loadingNextPageStreamValue,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
