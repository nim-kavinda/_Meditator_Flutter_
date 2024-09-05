import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditor/models/sleep_exercise_model.dart';

class SleepExerciseService {
  var sleepBox = Hive.box("sleep_data");

  //method to add new seleep exe
  Future<void> addSleepExercise(
      SleepExercise sleepExe, BuildContext context) async {
    try {
      final allSleepExercises = sleepBox.get("sleep_data") ?? [];

      await allSleepExercises.add(sleepExe);

      await sleepBox.put("sleep_data", allSleepExercises);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sleep Exercise Added"),
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
    } catch (e) {
      print("Service Error:$e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error adding new Sleep Exercise"),
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
    }
  }

  //method to get sleep exercises
  List<SleepExercise> getSleepExercises() {
    try {
      final allSleepExercises = sleepBox.get("sleep_data");

      if (allSleepExercises != null && allSleepExercises is List<dynamic>) {
        return allSleepExercises.cast<SleepExercise>().toList();
      } else {
        return [];
      }
    } catch (e) {
      print("get service error:$e");
      return [];
    }
  }

  //delete to mindfullness exercise
  Future<void> deleteSleepExercises(
      SleepExercise sleepExercise, BuildContext context) async {
    try {
      final allSleepExercises = sleepBox.get("sleep_data");
      allSleepExercises.remove(sleepExercise);

      await sleepBox.put("sleep_data", allSleepExercises);
    } catch (e) {
      print("Delete Service Error:$e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error Deleting sleep Exercise"),
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
    }
  }
}
