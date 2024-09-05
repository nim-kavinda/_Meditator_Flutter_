import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditor/models/meditation_exercise_model.dart';

class MeditationService {
  var meditationBox = Hive.box("meditations_data");

  //method to add a new meditation

  Future<void> addMeditation(
      MeditationExercise meditation, BuildContext context) async {
    try {
      final dynamic allMeditation = meditationBox.get("meditations_data");

      List<Map<String, dynamic>> meditationList = [];

      if (allMeditation != null && allMeditation is List) {
        meditationList = List<Map<String, dynamic>>.from(allMeditation
            .map((meditation) => Map<String, dynamic>.from(meditation)));
      }

      meditationList.add(meditation.toJson());

      await meditationBox.put("meditations_data", meditationList);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Meditation Added"),
        duration: Duration(
          seconds: 2,
        ),
      ));
    } catch (e) {
      print("Service Error:$e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Failed To  Added Meditation"),
        duration: Duration(
          seconds: 2,
        ),
      ));
    }
  }

//method to get all meditation
  List<MeditationExercise> getMeditation() {
    try {
      final dynamic allMeditations = meditationBox.get("meditations_data");
      if (allMeditations != null && allMeditations is List) {
        return allMeditations.map((meditation) {
          if (meditation is Map<String, dynamic>) {
            return MeditationExercise.fromJson(meditation);
          } else {
            return MeditationExercise.fromJson(
                Map<String, dynamic>.from(meditation));
          }
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      print("Service load Error:$e");
      return [];
    }
  }

  //method a delete a mediation
  Future<void> deletMediation(
      MeditationExercise mediattionE, BuildContext context) async {
    try {
      final dynamic allMeditations = meditationBox.get("meditations_data");
      if (allMeditations != null && allMeditations is List) {
        List<Map<String, dynamic>> meditationList =
            List<Map<String, dynamic>>.from(allMeditations
                .map((mediattion) => Map<String, dynamic>.from(mediattion)));

        meditationList.removeWhere((mediattion) {
          MeditationExercise currentMeditation = MeditationExercise.fromJson(
              Map<String, dynamic>.from(mediattion));

          return currentMeditation.name == mediattionE.name &&
              currentMeditation.category == mediattionE.category;
        });
        await meditationBox.put("meditations_data", meditationList);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Meditation Delelted"),
          duration: Duration(
            seconds: 2,
          ),
        ));
      }
    } catch (e) {
      print("Service Delete Error:$e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error Deleting Mediaition"),
        duration: Duration(
          seconds: 2,
        ),
      ));
    }
  }
}
