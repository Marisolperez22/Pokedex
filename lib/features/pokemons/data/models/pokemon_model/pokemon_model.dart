import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/pokemon.dart';

part 'pokemon_model.freezed.dart';

@freezed
abstract class PokemonModel with _$PokemonModel {
  const factory PokemonModel({
    required int id,
    required String name,
    required List<String> types,
    required String image,
    required int weight,
    required int height,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      types: (json['types'] as List)
          .map((t) => t['type']['name'] as String)
          .toList(),
      image: json['sprites']['front_default'] ?? '',
      weight: json['weight'],
      height: json['height'],
    );
  }

  factory PokemonModel.fromEntity(Pokemon pokemon) => PokemonModel(
        id: pokemon.id,
        name: pokemon.name,
        types: pokemon.types,
        image: pokemon.image,
        weight: pokemon.weight,
        height: pokemon.height,
      );
}

extension PokemonModelX on PokemonModel {
  Pokemon toEntity() => Pokemon(
        id: id,
        name: name,
        types: types,
        image: image,
        weight: weight,
        height: height,
      );
}
