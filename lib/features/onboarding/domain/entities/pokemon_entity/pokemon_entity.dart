import 'package:freezed_annotation/freezed_annotation.dart';
part 'pokemon_entity.freezed.dart';
part 'pokemon_entity.g.dart';

@freezed
abstract class PokemonEntity with _$PokemonEntity {
  const factory PokemonEntity({
    required int id,
    required String name,
    required String imageUrl,
    required List<String> types,
  }) = _PokemonEntity;

  factory PokemonEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntityFromJson(json);
}
