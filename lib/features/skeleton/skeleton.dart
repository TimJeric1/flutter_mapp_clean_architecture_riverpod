import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pokemon/presentation/pages/data_page.dart';
import '../pokemon/presentation/pages/pokemon_page.dart';
import 'package:provider/provider.dart';
import 'widgets/custom_bottom_bar_widget.dart';
import 'providers/selected_page_provider.dart';

List<Widget> pages = const [
  PokemonPage(),
  DataPage(),
];

class Skeleton extends ConsumerWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedPage = ref.watch(selectedPageNotiferProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Poke-Map'),
      ),
      body: pages[selectedPage],
      bottomNavigationBar: const CustomBottomBarWidget(),
    );
  }
}
