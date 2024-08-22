import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';
import 'package:meditor/models/sleep_exercise_model.dart';
import 'package:meditor/provider/filter_provider.dart';
import 'package:meditor/utils/colors.dart';
import 'package:meditor/utils/text_style.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                                    label: Text("All"),
                                    onSelected: (value) {},
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text("MindFullness"),
                                    onSelected: (value) {},
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text("Meditation"),
                                    onSelected: (value) {},
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text("Sleep Stories"),
                                    onSelected: (value) {},
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
                                  onTap: () {},
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
