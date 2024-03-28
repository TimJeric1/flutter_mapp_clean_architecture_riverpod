import 'package:flutter/material.dart';
import 'package:flutter_mapp_clean_architecture/features/pokemon_image/presentation/providers/pokemon_image_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'features/pokemon/presentation/providers/pokemon_provider.dart';
import 'features/pokemon/presentation/providers/selected_pokemon_item_provider.dart';
import 'features/skeleton/providers/selected_page_provider.dart';
import 'features/skeleton/skeleton.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPokemonItem = ref.read(selectedPokemonItemNotifierProvider);
    ref.read(pokemonNotifierProvider.notifier).getPokemon(pokemonId: (selectedPokemonItem+1).toString());

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Poke Map',
        theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black87,
            )),
        home: const Skeleton(),
      );

  }
}

