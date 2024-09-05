import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';

class MindfullExreciseService {
  var mindfulnessBox = Hive.box("mindfullness_data");

  Future<void> addMindfullExercise(
      MindfullnessExercise MindfullExercise, BuildContext context) async {
    try {
      final allMindFullnessExerice =
          mindfulnessBox.get("mindfullness_data") ?? [];

      await allMindFullnessExerice.add(MindfullExercise);

      await mindfulnessBox.put("mindfullness_data", allMindFullnessExerice);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Mindfull Exercise Added"),
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
    } catch (e) {
      print("service erreor:$e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error Adding Mindfull Exercise"),
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
    }
  }

  //method to get mindfull exercises
  List<MindfullnessExercise> getMindfulnessExercise() {
    try {
      final allMindFullnessExerice = mindfulnessBox.get("mindfullness_data");

      if (allMindFullnessExerice != null &&
          allMindFullnessExerice is List<dynamic>) {
        return allMindFullnessExerice.cast<MindfullnessExercise>().toList();
      } else {
        return [];
      }
    } catch (e) {
      print("get service error:$e");
      return [];
    }
  }

  //delete to mindfullness exercise
  Future<void> deleteMindfulexercise(
      MindfullnessExercise mindfulnessExercise, BuildContext context) async {
    try {
      final allMindFullnessExerice = mindfulnessBox.get("mindfullness_data");
      allMindFullnessExerice.remove(mindfulnessExercise);

      await mindfulnessBox.put("mindfullness_data", allMindFullnessExerice);
    } catch (e) {
      print("Delete Service Error:$e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error deleiting Mindfulness Exercise"),
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
    }
  }
}
