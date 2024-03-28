import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'selected_pokemon_item_provider.g.dart';


@Riverpod(keepAlive: true)
class SelectedPokemonItemNotifier extends _$SelectedPokemonItemNotifier {


  @override
  int build() => 0;


  void changeNumber({required int newNumber}) {
    state = newNumber;
  }

}
