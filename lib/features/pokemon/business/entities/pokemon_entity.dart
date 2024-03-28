import 'sub_entites.dart';

class PokemonEntity {
  final String name;
  final int id;
  final SpritesEntity sprites;
  final List<TypesEntity> types;
  const PokemonEntity({
    required this.name,
    required this.id,
    required this.sprites,
    required this.types,
  });

  factory PokemonEntity.nullPokemonEntity() {
    return const PokemonEntity(
      name: 'Default Pokemon',
      id: 0,
      sprites: SpritesEntity(other: OtherEntity(officialArtwork: OfficialArtworkEntity(frontDefault: "",frontShiny: ""))),
      types: [],
    );
  }
}
