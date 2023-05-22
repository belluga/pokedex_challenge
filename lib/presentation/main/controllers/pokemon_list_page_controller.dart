import 'package:moduler_route/moduler_route.dart';
import 'package:pokedex_challenge/domain/controllers_ccntracts/pokemon_list_page_controller_contract.dart';
import 'package:pokedex_challenge/domain/repository_contracts/pokemon_repository_contract.dart';

class PokemonListPageController extends PokemonListPageControllerContract {
  PokemonListPageController();

  @override
  final itemRepository = Inject.get<PokemonRepositoryContract>()!;
}
