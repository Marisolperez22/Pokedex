import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/models/pokemon_model/pokemon_model.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../data/datasources/pokemon_remote_datasource.dart';

final pokemonSearchProvider = StateProvider<String>((ref) => '');

final selectedTypesProvider = StateProvider<List<String>>((ref) => []);

final availableTypesProvider = Provider<List<String>>((ref) {
  return const [
    'Normal',
    'Fire',
    'Water',
    'Electric',
    'Grass',
    'Ice',
    'Fighting',
    'Poison',
    'Ground',
    'Flying',
    'Psychic',
    'Bug',
    'Rock',
    'Ghost',
    'Dragon',
    'Dark',
    'Steel',
    'Fairy',
  ];
});

final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final dataSource = PokemonRemoteDataSource();
  return PokemonRepositoryImpl(dataSource);
});

class PokemonListNotifier extends StateNotifier<AsyncValue<List<Pokemon>>> {
  final PokemonRepository repository;

  int _offset = 0;
  bool _isLoadingMore = false;
  bool _hasMore = true;

  PokemonListNotifier(this.repository) : super(const AsyncLoading()) {
    loadInitial();
  }

  Future<void> loadInitial() async {
    final result = await repository.getPokemonList(0, 20);
    result.fold((failure) => state = AsyncError(failure, StackTrace.current), (
      pokemons,
    ) {
      state = AsyncData(pokemons);
    });
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;
    _isLoadingMore = true;
    _offset += 20;

    final result = await repository.getPokemonList(_offset, 0);
    result.fold(
      (failure) {
        _isLoadingMore = false;
      },
      (newPokemons) {
        if (newPokemons.isEmpty) {
          _hasMore = false;
        } else {
          final current = state.value ?? [];
          state = AsyncData([...current, ...newPokemons]);
        }
        _isLoadingMore = false;
      },
    );
  }
}

final pokemonListProvider =
    StateNotifierProvider<PokemonListNotifier, AsyncValue<List<Pokemon>>>((
      ref,
    ) {
      final repo = ref.watch(pokemonRepositoryProvider);
      return PokemonListNotifier(repo);
    });

final searchQueryProvider = StateProvider<String>((ref) => '');

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
          final pokemonTypes = pokemon.types
              .map((type) => type)
              .where((name) => name != null)
              .cast<String>()
              .toSet();
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

  return filteredPokemons
      .map(
        (e) => PokemonModel(
          id: e.id,
          name: e.name,
          types: e.types,
          image: e.image,
          weight: e.weight,
          height: e.height,
          isFavorite: e.isFavorite,
        ),
      )
      .toList();
});

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
