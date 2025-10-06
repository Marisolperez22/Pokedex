import 'package:dio/dio.dart';

import '../../../../core/constants/app_constants.dart';
import '../models/pokemon_model/pokemon_model.dart';

abstract class IPokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemonList(int offset, int limit);
}

class PokemonRemoteDataSource implements IPokemonRemoteDataSource {
  final Dio _dio = Dio();
  final baseUrl = AppConstants.baseUrl;

  @override
  Future<List<PokemonModel>> getPokemonList(int offset, int limit) async {
    final response = await _dio.get(
      '$baseUrl/pokemon',
      queryParameters: {'offset': offset, 'limit': limit},
    );

    final results = response.data['results'] as List;

    final futures = results.map((pokemon) async {
      final detail = await _dio.get(pokemon['url']);
      return PokemonModel.fromJson(detail.data);
    });

    final pokemons = await Future.wait(futures);
    return pokemons;
  }
}
