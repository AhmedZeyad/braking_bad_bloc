import 'package:braking_bad_bloc/main.dart';
import 'package:braking_bad_bloc/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? geterateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CharactersScreen());
    }
  }
}
