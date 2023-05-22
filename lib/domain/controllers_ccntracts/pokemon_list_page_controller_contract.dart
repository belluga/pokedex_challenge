import 'package:flutter/cupertino.dart';
import 'package:pokedex_challenge/domain/controllers_ccntracts/controller_paginated_contract.dart';
import 'package:pokedex_challenge/domain/repository_contracts/pokemon_repository_contract.dart';

abstract class PokemonListPageControllerContract extends ControllerPaginatedContract<PokemonRepositoryContract> {}