import 'package:braking_bad_bloc/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( BrakingBadApp(approuter: AppRouter(),));
}

class BrakingBadApp extends StatelessWidget {

  final AppRouter  approuter;

  const BrakingBadApp({super.key, required this.approuter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     onGenerateRoute: approuter.geterateRoute,
    );
  }
}
