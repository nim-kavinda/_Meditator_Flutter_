import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:meditor/models/function_data_model.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';
import 'package:meditor/models/sleep_exercise_model.dart';
import 'package:meditor/pages/functionPage.dart';
import 'package:meditor/pages/main_screen.dart';
import 'package:meditor/pages/main_screens/create_custome_exercise_page.dart';
import 'package:meditor/pages/mindfull_exercise_details_page.dart';
import 'package:meditor/pages/mindfull_exercises_timer_page.dart';
import 'package:meditor/pages/sleep_exercise_timer.dart';
import 'package:meditor/router/route_name.dart';

class RouterClass {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: RouteNames.home,
        builder: (context, state) {
          return MainScreen();
        },
      ),
      GoRoute(
        name: RouteNames.mindFullExercise,
        path: "/mindFullExercise",
        builder: (context, state) {
          final mindfullExerciseJson =
              state.uri.queryParameters["mindfullExercises"];

          final mindfullnessExercise =
              MindfullnessExercise.fromJson(jsonDecode(mindfullExerciseJson!));

          return MindfullExerciseDetailsPage(
              mindfullnessExercise: mindfullnessExercise);
        },
      ),
      GoRoute(
        path: "/functions",
        name: RouteNames.functions,
        builder: (context, state) {
          final FunctionData functionData = state.extra as FunctionData;
          return Functionpage(functionData: functionData);
        },
      ),
      GoRoute(
        path: "/mindfullExerciseTimer",
        name: RouteNames.midfullExerciseTimer,
        builder: (context, state) {
          final mindfullExerciseJson =
              state.uri.queryParameters["mindfullExercise"];
          final mindfullExercise =
              MindfullnessExercise.fromJson(jsonDecode(mindfullExerciseJson!));
          return MindfullExerciseTimer(
            mindfullExercise: mindfullExercise,
          );
        },
      ),
      GoRoute(
        path: "/sleepExerciseTimer",
        name: RouteNames.sleepStoryTimer,
        builder: (context, state) {
          final sleepExerciseJson = state.uri.queryParameters["sleepExercise"];
          final sleepExercise =
              SleepExercise.fromJson(jsonDecode(sleepExerciseJson!));
          return SleepExerciseTimer(sleepExercise: sleepExercise);
        },
      ),
      GoRoute(
        path: "/create",
        name: RouteNames.create,
        builder: (context, state) {
          return const CreateExercisePage();
        },
      ),
    ],
  );
}
