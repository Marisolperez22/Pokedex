import 'package:freezed_annotation/freezed_annotation.dart';
part 'pokemon.freezed.dart';

@freezed
abstract class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    required List<String> types,
    required String image,
    required int weight,
    required int height,
    required bool isFavorite,
  }) = _Pokemon;
}
