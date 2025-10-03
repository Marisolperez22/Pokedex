import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../onboarding/domain/entities/pokemon_entity/pokemon_entity.dart';
import '../../domain/repositories/pokemon_repository.dart';

part 'pokemon_list_provider.g.dart';

@riverpod
class PokemonListNotifier extends _$PokemonListNotifier {
  @override
  Future<List<PokemonEntity>> build() async {
    return ref.read(pokemonRepositoryProvider).getPokemonList(limit: 40);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(pokemonRepositoryProvider).getPokemonList(limit: 40));
  }
}

// provider para detalle
@riverpod
Future<PokemonEntity> pokemonDetail(PokemonDetailRef ref, String name) {
  return ref.read(pokemonRepositoryProvider).getPokemonDetail(name);
}
