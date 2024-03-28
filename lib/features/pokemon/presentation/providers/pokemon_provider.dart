import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mapp_clean_architecture/features/pokemon_image/presentation/providers/pokemon_image_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../business/entities/pokemon_entity.dart';
import '../../business/usecases/get_pokemon.dart';
import '../../data/datasources/pokemon_local_data_source.dart';
import '../../data/datasources/pokemon_remote_data_source.dart';
import '../../data/repositories/pokemon_repository_impl.dart';

part 'pokemon_provider.g.dart';

@Riverpod(keepAlive: true)
class PokemonNotifier extends _$PokemonNotifier {
  @override
  Future<PokemonEntity> build() => Future.value(PokemonEntity.nullPokemonEntity());

  void getPokemon({
    required String pokemonId,
  }) async {
    PokemonRepositoryImpl repository = PokemonRepositoryImpl(
      remoteDataSource: PokemonRemoteDataSourceImpl(dio: Dio()),
      localDataSource: PokemonLocalDataSourceImpl(
          sharedPreferences: await SharedPreferences.getInstance()),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final newPokemon =
        await GetPokemon(repository).call(params: PokemonParams(id: pokemonId));


    ref.read(pokemonImageNotifierProvider.notifier).updatePokemonImage(pokemonEntity: newPokemon);
    state = AsyncData(newPokemon);
  }
}
