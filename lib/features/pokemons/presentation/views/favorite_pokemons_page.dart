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
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        actions: [
          if (favoritePokemons.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              onPressed: () => _showClearAllDialog(context, ref),
              tooltip: 'Eliminar todos',
            ),
        ],
      ),
      body: favoritePokemonsAsync.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : favoritePokemons.isEmpty
          ? _buildEmptyState()
          : _buildFavoritesList(favoritePokemons),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'No tienes Pokémon favoritos',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Agrega Pokémon a favoritos tocando el corazón',
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

  void _showClearAllDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar todos los favoritos'),
        content: const Text(
          '¿Estás seguro de que quieres eliminar todos tus Pokémon favoritos?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              // Eliminar todos los favoritos usando ref.read()
              ref.read(favoritePokemonsProvider.notifier).state = [];
              Navigator.of(context).pop();

              // Mostrar snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Todos los favoritos han sido eliminados'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Eliminar todos'),
          ),
        ],
      ),
    );
  }
}
