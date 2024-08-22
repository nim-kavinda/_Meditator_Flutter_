import 'package:flutter/material.dart';
import 'package:meditor/models/meditation_exercise_model.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';
import 'package:meditor/models/sleep_exercise_model.dart';
import 'package:meditor/provider/meditation_provider.dart';
import 'package:meditor/provider/mindfull_exercise_provider.dart';
import 'package:meditor/provider/sleep_exercise_provider.dart';
import 'package:provider/provider.dart';

class FilterProvider extends ChangeNotifier {
  List<dynamic> _allData = [];
  List<dynamic> _filterdData = [];

  //get all the data from other providers

  Future<void> getData(BuildContext context) async {
    //ensure this run after build
    await Future.delayed(Duration.zero);

    //mindfull exercise
    final List<MindfullnessExercise> mindfullExercises =
        Provider.of<MindfullExerciseProvider>(context, listen: false)
            .mindfullExercises;

    //medtitaion Exercise
    final List<MeditationExercise> meditationExercises =
        Provider.of<MeditationProvider>(context, listen: false)
            .meditationExercises;

    //sleep exersices
    final List<SleepExercise> sleepExercises =
        Provider.of<SleepExerciseProvider>(context, listen: false)
            .sleepExercise;

    _allData = [
      ...mindfullExercises,
      ...meditationExercises,
      ...sleepExercises,
    ];
    _filterdData = _allData;
    notifyListeners();
  }

  //getter
  List<dynamic> get filterData => _filterdData;
}
