import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../business/entities/pokemon_entity.dart';
import '../providers/pokemon_provider.dart';

class DataWidget extends ConsumerWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<PokemonEntity> pokemon = ref.watch(pokemonNotifierProvider);

    return pokemon.when(
        data: (pokemon) => SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: const Text('API'),
                    title:
                        Text('https://pokeapi.co/api/v2/pokemon/${pokemon.id}'),
                    tileColor: Colors.orange,
                  ),
                  ListTile(
                    title: Text(kName),
                    subtitle: Text(pokemon.name),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(kId),
                    subtitle: Text(pokemon.id.toString()),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Text('{ }'),
                    title: Text(kSprites),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Text('{ }'),
                          title: Text(kOther),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Text('{ }'),
                                title: Text(kOfficialArtwork),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(kFrontDefault),
                                      subtitle: SelectableText(pokemon.sprites
                                          .other.officialArtwork.frontDefault),
                                    ),
                                    ListTile(
                                      title: Text(kFrontShiny),
                                      subtitle: SelectableText(pokemon.sprites
                                          .other.officialArtwork.frontShiny),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Text('[ ]'),
                    title: Text(kTypes),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      children: List.generate(
                        pokemon.types.length,
                        (index) => Column(
                          children: [
                            ListTile(
                              leading: const Text('{ }'),
                              title: Text(kType),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ListTile(
                                title: Text(kName),
                                subtitle: Text(
                                    pokemon.types.elementAt(index).type.name),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        error: (error, _) => Center(child: Text(error.toString())),
        loading: () => const CircularProgressIndicator());
  }
}
