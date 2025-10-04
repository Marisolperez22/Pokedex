import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/pokemon_list_provider.dart';

class PokemonSearchBar extends ConsumerWidget {
  const PokemonSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Procurar Pokemon...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.grey[50],
        ),
        onChanged: (value) {
          ref.read(pokemonSearchProvider.notifier).state = value;
        },
      ),
    );
  }
}