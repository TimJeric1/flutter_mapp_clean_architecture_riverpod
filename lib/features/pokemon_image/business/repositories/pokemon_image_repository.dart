import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../entities/pokemon_image_entity.dart';


abstract class PokemonImageRepository {
  Future<PokemonImageEntity> getPokemonImage({
    required PokemonImageParams pokemonImageParams,
  });
}
