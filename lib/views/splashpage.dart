import 'package:fitshell/constants/data.dart';
import 'package:fitshell/model/exercise.dart';
import 'package:fitshell/repositories/getDBrepo.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: GetDBRepo().getAllExercise(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<Exercise> data = snapshot.data as List<Exercise>;
              return ListView.builder(
                itemCount: bodyParts.length,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  List exercises = [];
                  for (var element in data) {
                    if (element.bodyPart == bodyParts[index]) {
                      exercises.add(element);
                    }
                  }
                  return ExpansionTile(
                    title: Text(bodyParts[index]),
                    children: List.generate(exercises.length, (i) {
                      return ExerciseCard(data: exercises[i]);
                    }),
                  );
                }),
              );
            } else {
              return const CircularProgressIndicator.adaptive();
            }
          },
        ),
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  ExerciseCard({Key? key, required this.data}) : super(key: key);
  Exercise data;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("Name : ${data.name}"),
          Text("Body Part : ${data.bodyPart}"),
          Text("Equipment : ${data.equipment}"),
          Text("Target : ${data.target}"),
          Image.network(data.gifUrl)
        ],
      ),
    );
  }
}
