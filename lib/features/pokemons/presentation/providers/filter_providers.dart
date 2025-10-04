import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../domain/entities/pokemon.dart';
import 'favorite_provider.dart';
import 'pokemon_list_provider.dart'; // Asegúrate de importar esto

// Provider para los tipos seleccionados
final selectedTypesProvider = StateProvider<List<String>>((ref) => []);

// Lista de todos los tipos disponibles
final availableTypesProvider = Provider<List<String>>((ref) {
  return const [
    'Normal', 'Fire', 'Water', 'Electric', 'Grass', 'Ice',
    'Fighting', 'Poison', 'Ground', 'Flying', 'Psychic',
    'Bug', 'Rock', 'Ghost', 'Dragon', 'Dark', 'Steel', 'Fairy'
  ];
});

// Provider para la lista filtrada por tipos
final filteredPokemonByTypeProvider = Provider<List<Pokemon>>((ref) {
  final selectedTypes = ref.watch(selectedTypesProvider);
  final pokemons = ref.watch(pokemonListWithFavoritesProvider);
  
  print('Filtrando por tipos: $selectedTypes'); // Debug
  
  // Si no hay tipos seleccionados, mostrar todos
  if (selectedTypes.isEmpty) {
    print('No hay tipos seleccionados, mostrando todos los Pokémon');
    return pokemons;
  }
  
  // Filtrar Pokémon que tengan AL MENOS UNO de los tipos seleccionados
  final filtered = pokemons.where((pokemon) {
    final hasMatchingType = selectedTypes.any((selectedType) => 
        pokemon.types.contains(selectedType));
    
    if (hasMatchingType) {
      print('${pokemon.name} coincide con los tipos: ${pokemon.types}');
    }
    
    return hasMatchingType;
  }).toList();
  
  print('Pokémon filtrados: ${filtered.length}');
  return filtered;
});

// Provider combinado (búsqueda + tipos)
final combinedFilteredPokemonProvider = Provider<List<Pokemon>>((ref) {
  final searchTerm = ref.watch(pokemonSearchProvider);
  final typeFilteredPokemons = ref.watch(filteredPokemonByTypeProvider);
  
  print('Búsqueda: "$searchTerm", Pokémon después de filtro de tipos: ${typeFilteredPokemons.length}'); // Debug
  
  if (searchTerm.isEmpty) return typeFilteredPokemons;
  
  final searchFiltered = typeFilteredPokemons.where((pokemon) =>
    pokemon.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
    pokemon.number.contains(searchTerm)
  ).toList();
  
  print('Pokémon después de búsqueda: ${searchFiltered.length}');
  return searchFiltered;
});