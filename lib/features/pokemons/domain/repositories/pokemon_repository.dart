import '../../data/models/pokemon_detail_response.dart';
import '../../data/models/pokemon_list_response.dart';

abstract class PokemonRepository {
  Future<List<PokemonListItem>> getPokemonList(int offset, int limit);
  Future<PokemonDetailResponse> getPokemonDetail(int id);
  Future<PokemonDetailResponse> getPokemonDetailByUrl(String url);

}
