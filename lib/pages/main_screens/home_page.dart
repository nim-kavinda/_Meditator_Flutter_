import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:meditor/models/function_data_model.dart';
import 'package:meditor/models/meditation_exercise_model.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';
import 'package:meditor/models/sleep_exercise_model.dart';
import 'package:meditor/provider/filter_provider.dart';
import 'package:meditor/router/route_name.dart';
import 'package:meditor/utils/colors.dart';
import 'package:meditor/utils/text_style.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //handel mindful exerice pressed
  void handelMindfullExercisePressed(
      BuildContext context, MindfullnessExercise data) {
    GoRouter.of(context).pushNamed(
      RouteNames.midfullExerciseTimer,
      queryParameters: {
        "mindfullExercise": jsonEncode(data.toJson()),
      },
    );
  }

  //handel meditation exerice pressed
  void handelMeditationExercisePressed(
    BuildContext context,
    final name,
    final description,
    final duration,
    final category,
    final videoUrl,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryPurple,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(category,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryGrey,
                      )),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$duration min',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          //todo............
                          GoRouter.of(context).push(
                            "/functions",
                            extra: FunctionData(
                              title: name,
                              duration: duration,
                              category: category,
                              description: description,
                              url: videoUrl,
                            ),
                          );
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            AppColors.primaryGreen,
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          shadowColor: WidgetStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                        ),
                        child: const Text(
                          "Start",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            AppColors.primaryGreen,
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          shadowColor: WidgetStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                        ),
                        child: const Text(
                          "Close",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //handel sleep exerice pressed
  void handelSleepExercisePressed(BuildContext context, SleepExercise data) {
    GoRouter.of(context).pushNamed(
      RouteNames.sleepStoryTimer,
      queryParameters: {
        "sleepExercise": jsonEncode(data.toJson()),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<FilterProvider>(context, listen: false)
              .getData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error Loading data"),
              );
            }
            return Consumer<FilterProvider>(
              builder: (BuildContext context, FilterProvider filterData,
                  Widget? child) {
                final completedData = filterData.filterData;
                completedData.shuffle();
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/meditation.png",
                              width: MediaQuery.of(context).size.width * 0.09,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Meditator",
                              style: TextStyle(
                                fontSize: 33,
                                color: AppColors.primaryPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Select a category to start exploring",
                          style: AppTextStyles.subtitleStyle.copyWith(
                            color: AppColors.primaryDarkBlue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryPurple.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  FilterChip(
                                    label: Text(
                                      "All",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "All"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("All");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "All",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.8),
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "MindFullness",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "MindFullness"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("MindFullness");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "MindFullness",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.8),
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Meditation",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "Meditation"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("Meditation");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "Meditation",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.8),
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Sleep Stories",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "Sleep Stories"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("Sleep Stories");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "Sleep Stories",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.8),
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (completedData.isNotEmpty)
                          StaggeredGrid.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: completedData.map(
                              (data) {
                                return GestureDetector(
                                  onTap: () {
                                    //todo:..........
                                    if (data is MindfullnessExercise) {
                                      handelMindfullExercisePressed(
                                          context, data);
                                    } else if (data is MeditationExercise) {
                                      handelMeditationExercisePressed(
                                        context,
                                        data.name,
                                        data.description,
                                        data.duration,
                                        data.category,
                                        data.videoUrl,
                                      );
                                    } else {
                                      handelSleepExercisePressed(context, data);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: data is MindfullnessExercise
                                          ? AppColors.primaryGreen
                                          : data is SleepExercise
                                              ? AppColors.primaryPurple
                                              : AppColors.primaryDarkBlue
                                                  .withOpacity(0.7),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.name,
                                            style: AppTextStyles.titleStyle
                                                .copyWith(
                                              color: AppColors.primaryWhite,
                                            ),
                                          ),
                                          Text(
                                            data.category,
                                            style: AppTextStyles.titleStyle
                                                .copyWith(
                                              color: AppColors.primaryBlack
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${data.duration} min",
                                            style: AppTextStyles.bodyStyle
                                                .copyWith(
                                                    color: AppColors
                                                        .primaryBlack
                                                        .withOpacity(0.5)),
                                          ),
                                          Text(
                                            data.description,
                                            style: AppTextStyles.bodyStyle
                                                .copyWith(
                                              color: AppColors.primaryWhite,
                                            ),
                                            maxLines:
                                                (data.description.length / 2)
                                                    .toInt(),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
