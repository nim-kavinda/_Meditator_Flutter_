import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meditor/models/meditation_exercise_model.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';
import 'package:meditor/models/sleep_exercise_model.dart';
import 'package:meditor/services/meditation_service.dart';
import 'package:meditor/services/mindfull_exrecise_service.dart';
import 'package:meditor/services/sleep_exercise_service.dart';

class CustomDataPrvider extends ChangeNotifier {
  final List<MeditationExercise> _meditations = [];
  final List<SleepExercise> _sleepExercise = [];
  final List<MindfullnessExercise> _mindfullExercise = [];

  //getters
  List<MeditationExercise> get meditations => _meditations;
  List<SleepExercise> get sleepExercise => _sleepExercise;
  List<MindfullnessExercise> get mindfullExercise => _mindfullExercise;

  //method to add a new meditation
  void addMeditation(MeditationExercise mediation, BuildContext context) {
    try {
      _meditations.add(mediation);

      try {
        MeditationService().addMeditation(mediation, context);
      } catch (e) {
        print("Provider Local Storage error :$e");
      }
      notifyListeners();
    } catch (e) {
      print("Prvider Errror:$e");
    }
  }

  //method to add a new sleep exercise
  void addSleepExercise(SleepExercise sleppExercise, BuildContext context) {
    try {
      _sleepExercise.add(sleppExercise);

      try {
        SleepExerciseService().addSleepExercise(sleppExercise, context);
      } catch (e) {
        print("Error provider loacal storage:$e");
      }
      notifyListeners();
    } catch (e) {
      print("Error From Provider:$e");
    }
  }

  //method to add a new sleep exercise
  void addMindfullExercise(
      MindfullnessExercise mindfullExercise, BuildContext context) {
    try {
      _mindfullExercise.add(mindfullExercise);

      try {
        MindfullExreciseService()
            .addMindfullExercise(mindfullExercise, context);
      } catch (e) {
        print("Error provider loacal storage:$e");
      }
      notifyListeners();
    } catch (e) {
      print("Error From Provider:$e");
    }
  }

  //--GET
  List<MeditationExercise> getMediatation() {
    try {
      final List<MeditationExercise> allmeditataions =
          MeditationService().getMeditation();

      return allmeditataions;
    } catch (e) {
      print("get provider error:$e");
      return [];
    }
  }

  List<MindfullnessExercise> getMindfulnessExercises() {
    try {
      final List<MindfullnessExercise> allMindfull =
          MindfullExreciseService().getMindfulnessExercise();

      return allMindfull;
    } catch (e) {
      print("get provider error:$e");
      return [];
    }
  }

  List<SleepExercise> getSleepExercise() {
    try {
      final List<SleepExercise> allSleep =
          SleepExerciseService().getSleepExercises();

      return allSleep;
    } catch (e) {
      print("get provider error:$e");
      return [];
    }
  }

  //-DELETE

  void deleteMeditation(
      MeditationExercise meditationExercise, BuildContext context) {
    try {
      _meditations.remove(meditations);
      try {
        MeditationService().deletMediation(meditationExercise, context);
      } catch (e) {
        print("Provider Local Stroge Error");
      }
      notifyListeners();
    } catch (e) {
      print("Delete Provieder Error:$e");
    }
  }

  void deletMindfullness(
      MindfullnessExercise mindfulnessExercise, BuildContext context) {
    try {
      _mindfullExercise.remove(mindfullExercise);
      try {
        MindfullExreciseService()
            .deleteMindfulexercise(mindfulnessExercise, context);
      } catch (e) {
        print("Provider Local Stroge Error");
      }
      notifyListeners();
    } catch (e) {
      print("Delete Provieder Error:$e");
    }
  }

  void deleteSleepExe(SleepExercise sleepExercise, BuildContext context) {
    try {
      _sleepExercise.remove(sleepExercise);
      try {
        SleepExerciseService().deleteSleepExercises(sleepExercise, context);
      } catch (e) {
        print("Provider Local Stroge Error");
      }
      notifyListeners();
    } catch (e) {
      print("Delete Provieder Error:$e");
    }
  }
}
