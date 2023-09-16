import 'package:flutter/material.dart';
import 'package:poke_dex/components/type_wiget.dart';
import 'package:poke_dex/model/pokemon.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: pokemon.baseColor!.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(pokemon.name),
                  Text(pokemon.num),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        pokemon.type.map((e) => TypeWiget(name: e)).toList(),
                  ),
                  Flexible(child: Image.network(pokemon.imagem)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
