import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../pokemon/data/datasources/pokemon_local_data_source.dart';
import '../models/pokemon_image_model.dart';



part 'pokemon_image_local_data_source.g.dart';

@riverpod
Future<PokemonImageLocalDataSourceImpl> pokemonImageLocalDataSourceImpl(PokemonImageLocalDataSourceImplRef ref) async {
  final sharedPreferences = await ref.read(sharedPreferencesProvider.future);
  return PokemonImageLocalDataSourceImpl(sharedPreferences: sharedPreferences);
}


abstract class PokemonImageLocalDataSource {
  Future<void> cachePokemonImage({required PokemonImageModel? pokemonImageToCache});
  Future<PokemonImageModel> getLastPokemonImage();
}

const cachedPokemonImage = 'CACHED_POKEMON_IMAGE';

class PokemonImageLocalDataSourceImpl implements PokemonImageLocalDataSource {
  final SharedPreferences sharedPreferences;

  PokemonImageLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<PokemonImageModel> getLastPokemonImage() {
    final jsonString = sharedPreferences.getString(cachedPokemonImage);

    if (jsonString != null) {
      return Future.value(PokemonImageModel.fromJson(json: json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cachePokemonImage({required PokemonImageModel? pokemonImageToCache}) async {
    if (pokemonImageToCache != null) {
      sharedPreferences.setString(
        cachedPokemonImage,
        json.encode(
          pokemonImageToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
