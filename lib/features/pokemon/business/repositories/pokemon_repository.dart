import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../data/models/pokemon_model.dart';
import '../entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<PokemonModel> getPokemon({required PokemonParams params});
}
