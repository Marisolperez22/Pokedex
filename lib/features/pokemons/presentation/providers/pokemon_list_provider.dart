// Providers base
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/datasources/pokemon_remote_datasource.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../domain/entities/pokemon.dart';
import 'repository_provider.dart';

final pokemonRemoteDataSourceProvider = Provider<PokemonRemoteDataSource>(
  (ref) => PokemonRemoteDataSource(),
);

final pokemonRepositoryProvider = Provider<PokemonRepository>(
  (ref) => PokemonRepositoryImpl(
    remoteDataSource: ref.read(pokemonRemoteDataSourceProvider),
  ),
);

// Provider para la lista de Pokémon con detalles
final pokemonListProvider = FutureProvider<List<Pokemon>>((ref) async {
  final repository = ref.read(pokemonRepositoryProvider);
  
  // Obtener lista básica
  final pokemonList = await repository.getPokemonList(0, 20);
  
  // Obtener detalles en paralelo para mejor performance
  final pokemonDetails = await Future.wait(
    pokemonList.map((item) => repository.getPokemonDetailByUrl(item.url)),
  );
  
  // Convertir a entidades Pokemon
  return pokemonDetails.map((detail) {
    return Pokemon(
      id: detail.id,
      name: detail.name,
      imageUrl: detail.sprites.frontDefault,
      types: detail.types.map((type) => type.type.capitalized).toList(),
    );
  }).toList();
});

// Provider para búsqueda
final pokemonSearchProvider = StateProvider<String>((ref) => '');

// Provider para lista filtrada
final filteredPokemonListProvider = Provider<List<Pokemon>>((ref) {
  final searchTerm = ref.watch(pokemonSearchProvider);
  final pokemonListAsync = ref.watch(pokemonListProvider);
  
  return pokemonListAsync.when(
    data: (pokemons) {
      if (searchTerm.isEmpty) return pokemons;
      return pokemons.where((pokemon) =>
        pokemon.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
        pokemon.number.contains(searchTerm)
      ).toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
});