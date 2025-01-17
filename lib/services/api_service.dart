import 'dart:convert';
import 'package:http/http.dart' as http;
import '../class/pokemon.dart';

class ApiService {
  // URL correcte de l'API pour récupérer tous les Pokémon
  static const String apiUrl = 'https://tyradex.vercel.app/api/v1/pokemon';

  static Future<List<Pokemon>> fetchPokemons() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List;
        final List<Pokemon> pokemons = [];

        for (var pokemonData in data) {
          try {
            final pokemon = Pokemon.fromJson(pokemonData);
            pokemons.add(pokemon);
          } catch (e) {
            print('Erreur lors du parsing du Pokémon: $e');
            // Continue avec le prochain Pokémon en cas d'erreur
            continue;
          }
        }

        return pokemons;
      } else {
        throw Exception('Erreur serveur : ${response.statusCode}');
      }
    } catch (error) {
      print('Erreur lors du chargement des Pokémons: $error');
      rethrow;
    }
  }
}
