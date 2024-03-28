import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mapp_clean_architecture/features/pokemon_image/business/entities/pokemon_image_entity.dart';
import 'package:flutter_mapp_clean_architecture/features/pokemon_image/presentation/providers/pokemon_image_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../../../../../core/errors/failure.dart';

class PokemonImageWidget extends ConsumerWidget {
  const PokemonImageWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<PokemonImageEntity> pokemonImageEntity =
        ref.watch(pokemonImageNotifierProvider);

    return pokemonImageEntity.when(
      data: (pokemonImageEntity) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.orange,
              image: DecorationImage(
                image: FileImage(File(pokemonImageEntity.path)),
              ),
            ),
            child: child,
          ),
        );
      },
      error: (error, _) {
        return Expanded(
          child: Center(
            child: Text(
              error.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
