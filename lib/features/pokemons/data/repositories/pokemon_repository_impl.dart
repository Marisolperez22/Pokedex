import '../../presentation/providers/repository_provider.dart';
import '../datasources/pokemon_remote_datasource.dart';
import '../models/pokemon_detail_response.dart';
import '../models/pokemon_list_response.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PokemonListItem>> getPokemonList(int offset, int limit) async {
    final response = await remoteDataSource.fetchPokemonList(offset, limit);
    return response.results;
  }

  @override
  Future<PokemonDetailResponse> getPokemonDetail(int id) {
    return remoteDataSource.fetchPokemonDetail(id);
  }

  @override
  Future<PokemonDetailResponse> getPokemonDetailByUrl(String url) {
    return remoteDataSource.fetchPokemonDetailByUrl(url);
  }
}