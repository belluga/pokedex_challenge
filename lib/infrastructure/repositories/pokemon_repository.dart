import 'package:flutter/material.dart';
import 'package:pokedex_challenge/domain/api_handler/api_handler.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon_summary.dart';
import 'package:pokedex_challenge/domain/repository_contracts/pokemon_repository_contract.dart';
import 'package:pokedex_challenge/infrastructure/services/pokeaki/endpoints/pokeapi_get_pokemon_specific.dart';
import 'package:pokedex_challenge/infrastructure/services/pokeaki/endpoints/pokeapi_get_pokemons.dart';
import 'package:pokedex_challenge/infrastructure/services/pokeaki/pokeapi_api_settings.dart';

class PokemonRepository extends PokemonRepositoryContract {
  @override
  int get perPageItems => 20;

  @override
  int get currentOffset => currentPage * perPageItems;

  @override
  Future<Pokemon> getItemByID(String itemID) async {
    final _apiHandler = APIHandler(
      apiSettings: PokeapiAPISettings(),
      endpoint: PokeapiGetPokemonSpecific(pokemonID: itemID),
      // data: {"limit": perPageItems, "offset": currentOffset},
    );

    try{
      final Map<String, dynamic> decodedResponse = await _apiHandler.execute();
      return Pokemon.fromJson(decodedResponse);
    }catch(e, stack){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stack);
      throw Exception("Error trying to find itemId: $itemID");
    }
  }

  @override
  Future<List<PokemonSummary>> getItemsNew({int? page}) async {
    final _apiHandler = APIHandler(
      apiSettings: PokeapiAPISettings(),
      endpoint: PokeapiGetPokemons(),
      data: {"limit": perPageItems, "offset": currentOffset},
    );

    try {
      final Map<String, dynamic> decodedResponse = await _apiHandler.execute();

      currentPage++;
      totalPages =
          ((decodedResponse["count"] / perPageItems) as double).floor();

      final List<Map<String, dynamic>> finalList =
          (decodedResponse["results"] as List)
              .map((e) => e as Map<String, dynamic>)
              .toList();

      final List<PokemonSummary> _pokemonItems =
          finalList.map((e) => PokemonSummary.fromJson(e)).toList();

      return Future.value(_pokemonItems);
    } catch (e, stack) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stack);
      throw Exception("Response don't have the expected format.");
    }
  }
}
