import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../core/params/params.dart';
import '../models/pokemon_model.dart';


part 'pokemon_remote_data_source.g.dart';


@riverpod
Dio dio(DioRef ref) {
  return Dio();
}

@riverpod
Future<PokemonRemoteDataSourceImpl> pokemonRemoteDataSourceImpl(PokemonRemoteDataSourceImplRef ref) async {
  final _dio = ref.read(dioProvider);
  return PokemonRemoteDataSourceImpl(dio: _dio);
}


abstract class PokemonRemoteDataSource {
  Future<PokemonModel> getPokemon({required PokemonParams params});
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl({required this.dio});

  @override
  Future<PokemonModel> getPokemon({required PokemonParams params}) async {
    final response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon/${params.id}',
      queryParameters: {
        'api_key': 'if you need',
      },
    );

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
