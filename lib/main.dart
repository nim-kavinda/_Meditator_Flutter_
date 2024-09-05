import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meditor/models/meditation_exercise_model.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';
import 'package:meditor/models/sleep_exercise_model.dart';
import 'package:meditor/provider/custom_data-provider.dart';
import 'package:meditor/provider/filter_provider.dart';
import 'package:meditor/provider/meditation_provider.dart';
import 'package:meditor/provider/mindfull_exercise_provider.dart';
import 'package:meditor/provider/sleep_exercise_provider.dart';
import 'package:meditor/router/router.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(MeditationExerciseAdapter());
  Hive.registerAdapter(MindfullnessExerciseAdapter());
  Hive.registerAdapter(SleepExerciseAdapter());

  await Hive.openBox("meditations_data");
  await Hive.openBox("mindfullness_data");
  await Hive.openBox("sleep_data");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MindfullExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MeditationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SleepExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomDataPrvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Meditade App",
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      routerConfig: RouterClass().router,
    );
  }
}
