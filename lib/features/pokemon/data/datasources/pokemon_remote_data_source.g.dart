// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_remote_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'58eeefbd0832498ca2574c1fe69ed783c58d1d8f';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$pokemonRemoteDataSourceImplHash() =>
    r'168e521d3df6908938a1a0c83e15108e40af0d50';

/// See also [pokemonRemoteDataSourceImpl].
@ProviderFor(pokemonRemoteDataSourceImpl)
final pokemonRemoteDataSourceImplProvider =
    AutoDisposeFutureProvider<PokemonRemoteDataSourceImpl>.internal(
  pokemonRemoteDataSourceImpl,
  name: r'pokemonRemoteDataSourceImplProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonRemoteDataSourceImplHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PokemonRemoteDataSourceImplRef
    = AutoDisposeFutureProviderRef<PokemonRemoteDataSourceImpl>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
