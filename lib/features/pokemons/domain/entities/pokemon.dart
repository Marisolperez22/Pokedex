class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final String number;
  final bool isFavorite;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    this.isFavorite = false,
  }) : number = 'N°${id.toString().padLeft(3, '0')}';

  String get capitalizedName => 
      name[0].toUpperCase() + name.substring(1);

  String get primaryType => types.isNotEmpty ? types[0] : 'Normal';

  Pokemon copyWith({bool? isFavorite}) {
    return Pokemon(
      id: id,
      name: name,
      imageUrl: imageUrl,
      types: types,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}