class PokemonDetailResponse {
  final int id;
  final String name;
  final Sprites sprites;
  final List<TypeSlot> types;

  PokemonDetailResponse({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types,
  });

  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) {
    return PokemonDetailResponse(
      id: json['id'],
      name: json['name'],
      sprites: Sprites.fromJson(json['sprites']),
      types: (json['types'] as List)
          .map((type) => TypeSlot.fromJson(type))
          .toList(),
    );
  }
}

class Sprites {
  final String frontDefault;
  final String? frontShiny;

  Sprites({
    required this.frontDefault,
    this.frontShiny,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      frontDefault: json['front_default'] ?? '',
      frontShiny: json['front_shiny'],
    );
  }
}

class TypeSlot {
  final int slot;
  final PokemonType type;

  TypeSlot({
    required this.slot,
    required this.type,
  });

  factory TypeSlot.fromJson(Map<String, dynamic> json) {
    return TypeSlot(
      slot: json['slot'],
      type: PokemonType.fromJson(json['type']),
    );
  }
}

class PokemonType {
  final String name;
  final String url;

  PokemonType({
    required this.name,
    required this.url,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      name: json['name'],
      url: json['url'],
    );
  }

  String get capitalized => name[0].toUpperCase() + name.substring(1);
}