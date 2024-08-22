import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditor/pages/main_screen.dart';
import 'package:meditor/provider/filter_provider.dart';
import 'package:meditor/provider/meditation_provider.dart';
import 'package:meditor/provider/mindfull_exercise_provider.dart';
import 'package:meditor/provider/sleep_exercise_provider.dart';
import 'package:meditor/router/router.dart';
import 'package:provider/provider.dart';

void main() {
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
