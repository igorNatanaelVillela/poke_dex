import 'dart:convert';
import 'dart:io';

import 'package:poke_dex/model/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonController {
  static final PokemonController instance = PokemonController();

  static const _baseURL = 'https://raw.githubusercontent.com';

  Future<List<Pokemon>> getAllPokemon() async {
    http.Response response = await http.get(
      Uri.parse('$_baseURL/Biuni/PokemonGO-Pokedex/master/pokedex.json'),
    );
    print(response);
    try {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromJson(e)).toList();
    } catch (e) {
      throw "Erro ao listar dados";
    }
  }
}
