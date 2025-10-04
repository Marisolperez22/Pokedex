import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/favorite_provider.dart';
import '../providers/pokemon_list_provider.dart'
    hide filteredPokemonListProvider;
import '../widgets/pokemon_card.dart';
import '../widgets/pokemon_search_bar.dart';
import 'favorite_pokemons_page.dart';

class PokemonListPage extends ConsumerWidget {
  static const String name = 'pokemonList';

  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredPokemons = ref.watch(filteredPokemonListProvider);
    final pokemonListAsync = ref.watch(pokemonListProvider);

    return Scaffold(
      appBar: AppBar( // Agrega un AppBar para consistencia
        title: const Text('Pokedex'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Barra de búsqueda
            const PokemonSearchBar(),

            // Lista de Pokémon
            Expanded(
              child: pokemonListAsync.when(
                data: (pokemons) {
                  if (filteredPokemons.isEmpty) {
                    return const Center(
                      child: Text('No se encontraron Pokémon'),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredPokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = filteredPokemons[index];
                      return PokemonCard(pokemon: pokemon);
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Error cargando Pokémon',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        error.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => ref.invalidate(pokemonListProvider),
                        child: const Text('Reintentar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // ❌ ELIMINA ESTO: bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}