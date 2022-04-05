import 'dart:convert';
import 'package:fitshell/constants/urls.dart';
import 'package:fitshell/model/exercise.dart';
import 'package:fitshell/services/api_service.dart';
import 'package:http/http.dart';

class GetDBRepo {
  Future<List<Exercise>> getAllExercise() async {
    List<Exercise> exercises = [];
    Response response = await ApiService().getApi(ApiUrls.getAllExercisesUrl);

    try {
      if (response.statusCode == 200) {
        List data = json.decode(response.body);

        for (var element in data) {
          exercises.add(Exercise.fromJson(element));
        }
      } else {
        throw (response.body);
      }
    } catch (e) {
      print('error $e');
    }
    return exercises;
  }
}
