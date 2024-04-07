import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/characters.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({required this.character});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
            width: 100,
          child: Text(character.name,style: TextStyle(color: Colors.red,fontSize: 30,),),
          
        ),
        Image.network(character.image)
      ],
    );
  }
}
