/* // Providers base
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pokedex/features/pokemons/data/models/pokemon_model/pokemon_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../data/datasources/pokemon_remote_datasource.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';

final pokemonRemoteDataSourceProvider = Provider<PokemonRemoteDataSource>(
  (ref) => PokemonRemoteDataSource(),
);

final pokemonRepositoryProvider = Provider<PokemonRepository>(
  (ref) => PokemonRepositoryImpl(
     ref.read(pokemonRemoteDataSourceProvider),
  ),
);


final pokemonListProvider = FutureProvider<List<Pokemon>>((ref) async {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);

  // 1. Obtener la lista básica de Pokémon
  final pokemonListResult = await pokemonRepository.getPokemonList(0, 20);

  return pokemonListResult.fold((failure) => throw failure, (
    pokemonList,
  ) async {
    // 2. Obtener detalles para cada Pokémon en paralelo
    final List<Future<Pokemon>> detailFutures = pokemonList.results!.map((
      pokemonBasic,
    ) async {
      final detailResult = await pokemonRepository.getPokemonDetail(
        pokemonBasic.url,
      );

      return detailResult.fold(
        (failure) => throw failure,
        (pokemonDetail) => pokemonDetail, // Ya es una entidad Pokemon
      );
    }).toList();

    // Esperar a que todas las llamadas se completen
    final List<Pokemon> pokemonsWithDetails = await Future.wait(detailFutures);

    return pokemonsWithDetails;
  });
});

// Si necesitas convertir a PokemonModel, puedes crear este provider adicional:
final pokemonModelListProvider = Provider<List<PokemonModel>>((ref) {
  final pokemonListAsync = ref.watch(pokemonListProvider);

  return pokemonListAsync.when(
    data: (pokemons) {
      return pokemons.map((pokemon) => _mapPokemonToModel(pokemon)).toList();
    },
    loading: () => [],
    error: (error, stackTrace) => [],
  );
});

// Función helper para mapear de Pokemon (entidad) a PokemonModel
PokemonModel _mapPokemonToModel(Pokemon pokemon) {
  return PokemonModel(
    id: pokemon.id ?? 0,
    weight: pokemon.weight ?? 0,
    height: pokemon.height ?? 0,
    name: pokemon.name ?? '',
    isFavorite: pokemon.isFavorite ?? false,
    sprites: PokemonSpritesModel(frontDefault: pokemon.imageUrl ?? ''),
    types:
        pokemon.types
            ?.map(
              (type) => PokemonTypeModel(
                slot: type.slot ?? 0,
                type: TypeModel(name: type.name ?? '', url: type.url ?? ''),
              ),
            )
            .toList() ??
        [],
    abilities:
        pokemon.abilities
            ?.map(
              (ability) => PokemonAbilityModel(
                ability: AbilityModel(
                  name: ability.name ?? '',
                  url: ability.url ?? '',
                ),
                isHidden: ability.isHidden ?? false,
                slot: ability.slot ?? 0,
              ),
            )
            .toList() ??
        [],
  );
}

// Providers para los filtros
final searchQueryProvider = StateProvider<String>((ref) => '');

final selectedTypesProvider = StateProvider<Set<String>>((ref) => {});

// Provider combinado para filtrar Pokémon (usa la entidad Pokemon)
final combinedFilteredPokemonProvider = Provider<List<Pokemon>>((ref) {
  final pokemonListAsync = ref.watch(pokemonListProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  final selectedTypes = ref.watch(selectedTypesProvider);

  return pokemonListAsync.when(
    data: (pokemons) {
      List<Pokemon> filtered = pokemons;

      // Aplicar filtro de búsqueda por nombre
      if (searchQuery.isNotEmpty) {
        filtered = filtered
            .where(
              (pokemon) =>
                  pokemon.name?.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ) ??
                  false,
            )
            .toList();
      }

      // Aplicar filtro por tipos
      if (selectedTypes.isNotEmpty) {
        filtered = filtered.where((pokemon) {
          final pokemonTypes =
              pokemon.types
                  ?.map((type) => type.name)
                  .where((name) => name != null)
                  .cast<String>()
                  .toSet() ??
              {};
          return selectedTypes.every(
            (selectedType) => pokemonTypes.contains(selectedType),
          );
        }).toList();
      }

      return filtered;
    },
    loading: () => [],
    error: (error, stackTrace) => [],
  );
});

// Provider combinado que devuelve PokemonModel (para compatibilidad con tu widget)
final combinedFilteredPokemonModelProvider = Provider<List<PokemonModel>>((
  ref,
) {
  final filteredPokemons = ref.watch(combinedFilteredPokemonProvider);

  return filteredPokemons.map(_mapPokemonToModel).toList();
});


// Provider para la lista de Pokémon con detalles



// Provider para búsqueda
final pokemonSearchProvider = StateProvider<String>((ref) => '');

// Provider para lista filtrada
final filteredPokemonListProvider = Provider<List<Pokemon>>((ref) {
  final searchTerm = ref.watch(pokemonSearchProvider);
  final pokemonListAsync = ref.watch(pokemonListProvider);

  return pokemonListAsync.when(
    data: (pokemons) {
      if (searchTerm.isEmpty) return pokemons;
      return pokemons
          .where(
            (pokemon) => (pokemon.name ?? '').toLowerCase().contains(
              searchTerm.toLowerCase(),
            ),
          )
          .toList();
    },
    loading: () => [],
    error: (error, stackTrace) {
      // Puedes manejar el error de forma más específica aquí
      print('Error loading pokemons: $error');
      return [];
    },
  );
});
 */