import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  List<Character> getAllCharacter() {
    charactersRepository.getAllCharacter().then((characters) {
      if (characters.isNotEmpty) {
        emit(CharactersLoded(characters));
        this.characters = characters;
      } else {
        emit(CharactersError());
        getAllCharacter();
      }
    });
    return characters;
  }
}
