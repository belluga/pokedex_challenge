import 'package:flutter/material.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon_summary.dart';
import 'package:pokedex_challenge/domain/repository_contracts/repository_paginated_contract.dart';

abstract class PokemonRepositoryContract extends RepositoryPaginatedContract<PokemonSummary> {
  
  @protected
  int get perPageItems;

  @protected
  int get currentOffset;

  @override
  Future<Pokemon> getItemByID(String itemID);

  @override
  Future<List<PokemonSummary>> getItemsNew({int? page});
}
