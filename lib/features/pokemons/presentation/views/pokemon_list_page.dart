import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/pokemon_notifier.dart';
import '../widgets/pokemon_card.dart';
import '../widgets/pokemon_search_bar.dart';

class PokemonListPage extends ConsumerStatefulWidget {
  const PokemonListPage({super.key});
  static const name = 'pokemonList';

  @override
  ConsumerState<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends ConsumerState<PokemonListPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final notifier = ref.read(pokemonListProvider.notifier);
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      notifier.loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pokemonListProvider);

    return Scaffold(
      body: SafeArea(
        child: state.when(
          data: (pokemons) => Column(
            children: [
                          const PokemonSearchBar(),

              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: pokemons.length + 1,
                  itemBuilder: (context, index) {
                    if (index == pokemons.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final pokemon = pokemons[index];
                    return PokemonCard(pokemon: pokemon);
                  },
                ),
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text('Error: $err')),
        ),
      ),
    );
  }
}
