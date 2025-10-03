import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/pokemons/data/datasources/pokemon_remote_datasource.dart';
import '../../../../core/config/network/dio_client.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../domain/repositories/pokemon_repository.dart';

final dioClientProvider = Provider((ref) => DioClient());
final pokemonRemoteDataSourceProvider = Provider((ref) => PokemonRemoteDataSource(ref.read(dioClientProvider).client));
final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) => PokemonRepositoryImpl(ref.read(pokemonRemoteDataSourceProvider)));
