import 'package:dio/dio.dart';

import '../models/pokemon_detail_response.dart';
import '../models/pokemon_list_response.dart';

class PokemonRemoteDataSource {
  final Dio _dio = Dio();

  Future<PokemonListResponse> fetchPokemonList(int offset, int limit) async {
    final response = await _dio.get(
      'https://pokeapi.co/api/v2/pokemon',
      queryParameters: {'offset': offset, 'limit': limit},
    );
    return PokemonListResponse.fromJson(response.data);
  }

  Future<PokemonDetailResponse> fetchPokemonDetail(int id) async {
    final response = await _dio.get(
      'https://pokeapi.co/api/v2/pokemon/$id',
    );
    return PokemonDetailResponse.fromJson(response.data);
  }

  Future<PokemonDetailResponse> fetchPokemonDetailByUrl(String url) async {
    final response = await _dio.get(url);
    return PokemonDetailResponse.fromJson(response.data);
  }
}