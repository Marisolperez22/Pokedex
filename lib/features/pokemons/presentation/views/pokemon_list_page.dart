import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/pokemon_list_provider.dart';
import '../widgets/pokemon_list_item.dart';

class PokemonListPage extends ConsumerWidget {
  static const String name = 'pokemonList';

  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPokemons = ref.watch(pokemonListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Pokedex')),
      body: asyncPokemons.when(
        data: (list) {
          return RefreshIndicator(
            onRefresh: () => ref.read(pokemonListProvider.notifier).refresh(),
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) {
                final p = list[i];
                // Si imageUrl vacío, mostramos placeholder y fetch lazy en detalle
                return PokemonListItem(pokemon: p);
              },
            ),
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (e, st) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ocurrió un error'),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => ref.invalidate(pokemonListProvider),
                child: const Text('Reintentar'),
              )
            ],
          ),
        ),
      ),
      
    );
  }
}
