import 'package:dartz/dartz.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../business/repositories/pokemon_repository.dart';
import '../datasources/pokemon_local_data_source.dart';
import '../datasources/pokemon_remote_data_source.dart';
import '../models/pokemon_model.dart';

part 'pokemon_repository_impl.g.dart';

@riverpod
Future<PokemonRepositoryImpl> pokemonRepositoryImpl(
    PokemonRepositoryImplRef ref) async {
  final remoteDataSource =
      await ref.read(pokemonRemoteDataSourceImplProvider.future);
  final localDataSource =
      await ref.read(pokemonLocalDataSourceImplProvider.future);
  final networkInfo = ref.read(networkInfoImplProvider);
  return PokemonRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
      networkInfo: networkInfo);
}

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  final PokemonLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<PokemonModel> getPokemon({required PokemonParams params}) async {
    if (await networkInfo.isConnected!) {
      final remotePokemon = await remoteDataSource.getPokemon(params: params);
      localDataSource.cachePokemon(remotePokemon);
      return remotePokemon;
    } else {
      return localDataSource.getLastPokemon();
    }
  }
}
