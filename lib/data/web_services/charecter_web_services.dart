import 'package:dio/dio.dart';
import 'package:rick_and_morty/constants/app_link.dart';
import 'package:rick_and_morty/data/models/characters.dart';

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions option = BaseOptions(
      baseUrl: MyApiEndPoint.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(option);
  }
  Future<List<dynamic>> getAllCharacter() async {
    Response? response;
    try {
       response = await dio.get(MyApiEndPoint.charecters);
      // print("from data/webservices/charecter : ${response.data["results"].runtimeType}");
      return response.data['results'];
    } catch (e) {
      print("error :$e");
      // print("respoms :$response");


      return [];
    }
  }
}
