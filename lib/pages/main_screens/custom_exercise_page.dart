import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditor/router/route_name.dart';
import 'package:meditor/widget/tabs/meditation_tab.dart';
import 'package:meditor/widget/tabs/mindfullnes_tab.dart';
import 'package:meditor/widget/tabs/sleep_tab.dart';

class CustomExerciePage extends StatelessWidget {
  const CustomExerciePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Your Exercise"),
          bottom: const TabBar(tabs: [
            Tab(
              text: "Meditaion",
            ),
            Tab(
              text: "SleepExercise",
            ),
            Tab(
              text: "Mindfullnes",
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(RouteNames.create);
          },
          child: const Icon(Icons.add),
        ),
        body: const TabBarView(children: [
          MeditationTab(),
          SleepTab(),
          MindfilnessTab(),
        ]),
      ),
    );
  }
}
