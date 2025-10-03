import 'package:dio/dio.dart';

import '../../../onboarding/domain/entities/pokemon_entity/pokemon_entity.dart';

class PokemonRemoteDataSource {
  final Dio dio;
  PokemonRemoteDataSource(this.dio);

  Future<List<Map<String, dynamic>>> fetchPokemonList({int limit = 20, int offset = 0}) async {
    final resp = await dio.get('pokemon', queryParameters: {'limit': limit, 'offset': offset});
    final results = (resp.data['results'] as List).cast<Map<String, dynamic>>();
    return results;
  }

  Future<PokemonEntity> fetchPokemonDetail(String name) async {
    final resp = await dio.get('pokemon/$name');
    final data = resp.data;
    final id = data['id'] as int;
    final sprite = (data['sprites']['other']['official-artwork']['front_default'] ?? data['sprites']['front_default']) as String?;
    final types = (data['types'] as List).map((t) => t['type']['name'] as String).toList();
    return PokemonEntity(
      id: id,
      name: data['name'],
      imageUrl: sprite ?? '',
      types: types,
    );
  }
}
