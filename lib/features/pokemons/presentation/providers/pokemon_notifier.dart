import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../data/datasources/pokemon_remote_datasource.dart';



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
    result.fold(
      (failure) => state = AsyncError(failure, StackTrace.current),
      (pokemons) {
        state = AsyncData(pokemons);
      },
    );
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;
    _isLoadingMore = true;
    _offset += 20;

    final result = await repository.getPokemonList( _offset, 0);
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
    StateNotifierProvider<PokemonListNotifier, AsyncValue<List<Pokemon>>>((ref) {
  final repo = ref.watch(pokemonRepositoryProvider);
  return PokemonListNotifier(repo);
});