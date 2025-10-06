/* import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/pokemons/domain/entities/pokemon.dart';
import 'pokemon_list_provider.dart';

final pokemonDetailProvider = FutureProvider.family<Pokemon, int>((ref, pokemonId) async {
  final repository = ref.read(pokemonRepositoryProvider);
  
  // Obtener datos básicos
  final detailResponse = await repository.getPokemonDetail('pokemonId');
  
  // Mapear a la entidad Pokemon
  return Pokemon(
//     id: detailResponse.id,
//     name: detailResponse.name,
//     isFavorite: false,
// abilities: [],
//     imageUrl: detailResponse.sprites.frontDefault,
//     types: detailResponse.types.map((type) => type.type.capitalized).toList(),
//     // description: _getDescription(detailResponse.name), // Descripción hardcodeada por simplicidad
//     weight: detailResponse.weight,
//     height: detailResponse.height,
    // category: _getCategory(detailResponse.name), // Categoría hardcodeada
    // abilities: detailResponse.abilities.isNotEmpty 
    //     ? detailResponse.abilities.first.ability.name
    //     : 'Desconocida',
    // gender: PokemonGender(male: 87.5, female: 12.5), // Datos de ejemplo
    // weaknesses: [], // Calcular debilidades
    // stats: PokemonStats(
    //   hp: detailResponse.stats[0].baseStat,
    //   attack: detailResponse.stats[1].baseStat,
    //   defense: detailResponse.stats[2].baseStat,
    //   specialAttack: detailResponse.stats[3].baseStat,
    //   specialDefense: detailResponse.stats[4].baseStat,
    //   speed: detailResponse.stats[5].baseStat,
    // ),
  );
});
 
// Funciones auxiliares (en una app real, esto vendría de la API)
String _getDescription(String name) {
  final descriptions = {
    'bulbasaur': 'Tiene una semilla de planta en la espalda desde que nace. La semilla crece lentamente.',
    'ivysaur': 'Cuando el bulbo de su espalda crece, parece no poder ponerse de pie sobre sus patas traseras.',
    'venusaur': 'La planta florece cuando absorbe energía solar. Ésta le obliga a buscar siempre la luz del sol.',
    'charmander': 'Prefiere las cosas calientes. Dicen que cuando llueve le sale vapor de la punta de la cola.',
    'charmeleon': 'Cuando balancea su ardiente cola, eleva la temperatura a niveles muy altos.',
    // Agrega más descripciones según necesites
  };
  return descriptions[name] ?? 'Un Pokémon misterioso y fascinante.';
}

String _getCategory(String name) {
  final categories = {
    'bulbasaur': 'SEMILLA',
    'ivysaur': 'SEMILLA',
    'venusaur': 'SEMILLA',
    'charmander': 'LAGARTIJA',
    'charmeleon': 'LLAMA',
    // Agrega más categorías según necesites
  };
  return categories[name] ?? 'POKÉMON';
}

/* List<String> _getWeaknesses(List<TypeSlot> types) {
  final typeWeaknesses = {
    'Grass': ['Fire', 'Flying', 'Ice', 'Poison', 'Bug'],
    'Poison': ['Ground', 'Psychic'],
    'Fire': ['Water', 'Ground', 'Rock'],
    'Water': ['Electric', 'Grass'],
    'Electric': ['Ground'],
    // Agrega más tipos según necesites
  };

  final weaknesses = <String>[];
  for (final type in types) {
    final typeName = type.type.capitalized;
    if (typeWeaknesses.containsKey(typeName)) {
      weaknesses.addAll(typeWeaknesses[typeName]!);
    }
  }
  
  return weaknesses.toSet().toList(); // Remover duplicados
} */ */