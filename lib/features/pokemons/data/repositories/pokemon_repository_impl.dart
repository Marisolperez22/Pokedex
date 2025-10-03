import '../../../onboarding/domain/entities/pokemon_entity/pokemon_entity.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remote;

  PokemonRepositoryImpl(this.remote);

  @override
  Future<List<PokemonEntity>> getPokemonList({int limit = 20, int offset = 0}) async {
    final results = await remote.fetchPokemonList(limit: limit, offset: offset);
    return results.map((r) => PokemonEntity(
      id: 0,
      name: r['name'],
      imageUrl: '',
      types: [],
    )).toList();
  }

  @override
  Future<PokemonEntity> getPokemonDetail(String name) => remote.fetchPokemonDetail(name);
}
