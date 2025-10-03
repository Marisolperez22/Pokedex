// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PokemonListNotifier)
const pokemonListProvider = PokemonListNotifierProvider._();

final class PokemonListNotifierProvider
    extends $AsyncNotifierProvider<PokemonListNotifier, List<PokemonEntity>> {
  const PokemonListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokemonListNotifierHash();

  @$internal
  @override
  PokemonListNotifier create() => PokemonListNotifier();
}

String _$pokemonListNotifierHash() =>
    r'fa27f1c29d571745494c3d1d5a23f777ab07b811';

abstract class _$PokemonListNotifier
    extends $AsyncNotifier<List<PokemonEntity>> {
  FutureOr<List<PokemonEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<PokemonEntity>>, List<PokemonEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PokemonEntity>>, List<PokemonEntity>>,
              AsyncValue<List<PokemonEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
