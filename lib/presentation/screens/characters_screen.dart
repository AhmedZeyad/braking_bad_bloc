import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/constants/my_theem.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/presentation/widgets/character_card.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacter;
  @override
  void initState() {
    super.initState();
    // ! must be inside stat class
    // ! make the var call cubit usig blocprovider and take the value
    getDate();
  }

  void getDate() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacter();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, status) {
        if (status is CharactersLoded) {
          allCharacter = status.characters;
          return buildLoadedCharacter();
        } else {
          return buildUnLoadedCharacter();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            getDate();
          },
          child: Text('Relod'),
        ),
        title: const Text(
          'apptitle',
          style: TextStyle(
            color: MyTheem.ptextycolor,
          ),
        ),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildLoadedCharacter() {
    print(allCharacter[0].name);
    // print(allCharacter.length);
    print(allCharacter.length);
    return
        // SingleChildScrollView(
        // child:
        //  Container(
        //   height: 500,
        //   width: 400,
        //   color: Colors.grey,
        //   child:
        Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: allCharacter.length,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
            ),
            itemBuilder: (context, index) =>
                // Text(allCharacter[index].name),
                // Text(allCharacter[1].name)
                CharacterCard(
              character: allCharacter[index],
            ),
          ),
        )
      ],
    )
        // ,
        // )
        // )
        ;
  }

  Widget buildUnLoadedCharacter() {
    return Center(
      child: CircularProgressIndicator(
        color: MyTheem.pcolor,
      ),
    );
  }
}
