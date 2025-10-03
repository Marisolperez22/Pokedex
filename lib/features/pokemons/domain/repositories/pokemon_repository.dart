import '../../../onboarding/domain/entities/pokemon_entity/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemonList({int limit = 20, int offset = 0});
  Future<PokemonEntity> getPokemonDetail(String name);
}
