import 'package:flutter/material.dart';
import 'package:poke_dex/components/app_bar.dart';
import 'package:poke_dex/components/pokemon_item.dart';
import 'package:poke_dex/controller/pokemon_controller.dart';
import 'package:poke_dex/controller/user_controller.dart';
import 'package:poke_dex/model/pokemon.dart';
import 'package:poke_dex/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<User> _user;
  final List<Pokemon> _listPokemon = <Pokemon>[];
  List<Pokemon> _listP = <Pokemon>[];

  @override
  void initState() {
    super.initState();
    _user = UserController.instance.getUserData();
    PokemonController.instance.getAllPokemon().then((value) => {
          setState(() {
            _listPokemon.addAll(value);
            _listP = _listPokemon;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: _listP.map((e) => PokemonItem(pokemon: e)).toList(),
        ),
      ),
    );
  }
}
