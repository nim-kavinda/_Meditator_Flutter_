import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';
import 'package:meditor/provider/mindfull_exercise_provider.dart';
import 'package:meditor/router/route_name.dart';
import 'package:meditor/utils/colors.dart';
import 'package:meditor/utils/text_style.dart';
import 'package:provider/provider.dart';

class MindfullExercisePage extends StatelessWidget {
  const MindfullExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mindfull Exercise ",
          style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryPurple),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onChanged: (value) {
                    Provider.of<MindfullExerciseProvider>(context,
                            listen: false)
                        .searchMindfullExersice(value);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<MindfullExerciseProvider>(
                  builder: (BuildContext context,
                      MindfullExerciseProvider mindfullExercise,
                      Widget? child) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: mindfullExercise.mindfullExercises.length,
                      itemBuilder: (context, index) {
                        MindfullnessExercise singleMindfullnessExercise =
                            mindfullExercise.mindfullExercises[index];

                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              RouteNames.mindFullExercise,
                              queryParameters: {
                                "mindfullExercises": jsonEncode(
                                  singleMindfullnessExercise.toJson(),
                                )
                              },
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    AppColors.primaryDarkBlue.withOpacity(0.1)),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  singleMindfullnessExercise.imagePath,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.width * 0.15,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                singleMindfullnessExercise.name,
                                style: AppTextStyles.subtitleStyle,
                              ),
                              subtitle: Text(
                                singleMindfullnessExercise.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.bodyStyle.copyWith(
                                  color: AppColors.primaryDarkBlue
                                      .withOpacity(0.7),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
