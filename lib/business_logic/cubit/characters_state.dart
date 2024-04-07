part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}


final class CharactersLoded extends CharactersState {
  List<Character> characters;
  CharactersLoded(this.characters);
}
final class CharactersError extends CharactersState {


}
