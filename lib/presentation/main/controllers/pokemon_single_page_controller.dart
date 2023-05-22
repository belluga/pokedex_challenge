import 'package:pokedex_challenge/domain/controllers_ccntracts/pokemon_single_page_controller.dart';
import 'package:pokedex_challenge/domain/pokemon/pokemon.dart';
import 'package:stream_value/core/stream_value.dart';

class PokemonSinglePageController extends PokemonSinglePageControllerContract {
  
  @override
  final String pokemonID;

  @override
  final pokemonStreamValue = StreamValue<Pokemon?>();

  PokemonSinglePageController({
    required this.pokemonID,
  }){
    _init();
  }

  Future<void> _init() async{
    final Pokemon _pokemon = await itemRepository.getItemByID(pokemonID);
    pokemonStreamValue.addValue(_pokemon);
  }
}
