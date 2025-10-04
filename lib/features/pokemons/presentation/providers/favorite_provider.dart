import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../domain/entities/pokemon.dart';
import 'pokemon_list_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

// Provider para SharedPreferences
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Override sharedPreferencesProvider');
});

// StateNotifier para favoritos con persistencia
final favoritePokemonsProvider = StateNotifierProvider<FavoritePokemonsNotifier, List<int>>(
  (ref) => FavoritePokemonsNotifier(ref.read(sharedPreferencesProvider)),
);

class FavoritePokemonsNotifier extends StateNotifier<List<int>> {
  static const String _favoritesKey = 'favorite_pokemons';
  final SharedPreferences _prefs;

  FavoritePokemonsNotifier(this._prefs) : super(_loadFavorites(_prefs));

  static List<int> _loadFavorites(SharedPreferences prefs) {
    final favoritesString = prefs.getStringList(_favoritesKey);
    if (favoritesString == null) return [];
    
    return favoritesString.map((id) => int.parse(id)).toList();
  }

  void _saveFavorites(List<int> favorites) {
    final favoritesString = favorites.map((id) => id.toString()).toList();
    _prefs.setStringList(_favoritesKey, favoritesString);
  }

  void toggleFavorite(int pokemonId) {
    List<int> newFavorites;
    
    if (state.contains(pokemonId)) {
      newFavorites = state.where((id) => id != pokemonId).toList();
    } else {
      newFavorites = [...state, pokemonId];
    }
    
    state = newFavorites;
    _saveFavorites(newFavorites);
  }

  void removeFavorite(int pokemonId) {
    final newFavorites = state.where((id) => id != pokemonId).toList();
    state = newFavorites;
    _saveFavorites(newFavorites);
  }

  bool isFavorite(int pokemonId) {
    return state.contains(pokemonId);
  }
}

// Provider para lista de pokémon con favoritos
final pokemonListWithFavoritesProvider = Provider<List<Pokemon>>((ref) {
  final pokemonListAsync = ref.watch(pokemonListProvider);
  final favoriteIds = ref.watch(favoritePokemonsProvider);

  return pokemonListAsync.when(
    data: (pokemons) {
      return pokemons.map((pokemon) {
        return pokemon.copyWith(
          isFavorite: favoriteIds.contains(pokemon.id),
        );
      }).toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
});

// Provider para lista filtrada (búsqueda)
final filteredPokemonListProvider = Provider<List<Pokemon>>((ref) {
  final searchTerm = ref.watch(pokemonSearchProvider);
  final pokemons = ref.watch(pokemonListWithFavoritesProvider);
  
  if (searchTerm.isEmpty) return pokemons;
  
  return pokemons.where((pokemon) =>
    pokemon.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
    pokemon.number.contains(searchTerm)
  ).toList();
});

// Provider para lista de FAVORITOS solamente
final favoritePokemonListProvider = Provider<List<Pokemon>>((ref) {
  final favoriteIds = ref.watch(favoritePokemonsProvider);
  final allPokemons = ref.watch(pokemonListWithFavoritesProvider);
  
  return allPokemons
      .where((pokemon) => favoriteIds.contains(pokemon.id))
      .toList();
});