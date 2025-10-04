import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/pokemon.dart';
import '../providers/favorite_provider.dart';
import '../widgets/dismissible_pokemons_card.dart';

class FavoritePokemonsPage extends ConsumerWidget {
  const FavoritePokemonsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritePokemons = ref.watch(favoritePokemonListProvider);
    final favoritePokemonsAsync = ref.watch(pokemonListWithFavoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        
      ),
      body: favoritePokemonsAsync.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : favoritePokemons.isEmpty
          ? _buildEmptyState()
          : _buildFavoritesList(favoritePokemons),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/no_favorites.png'),
          const SizedBox(height: 16),
          Text(
            'No has marcado ningún Pokémon como favorito',
            textAlign: TextAlign.center,
            style: TextStyle(
            
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Haz clic en el ícono de corazón de tus Pokémon favoritos y aparecerán aquí.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesList(List<Pokemon> favoritePokemons) {
    return ListView.builder(
      itemCount: favoritePokemons.length,
      itemBuilder: (context, index) {
        final pokemon = favoritePokemons[index];
        return DismissiblePokemonCard(pokemon: pokemon, isDismissible: true);
      },
    );
  }
}
