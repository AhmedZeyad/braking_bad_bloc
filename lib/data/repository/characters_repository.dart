import 'package:rick_and_morty/constants/app_link.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/data/web_services/charecter_web_services.dart';
import 'package:rick_and_morty/data/models/characters.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);
  Future<List<Character>> getAllCharacter() async {
    final characters = await charactersWebServices.getAllCharacter();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
