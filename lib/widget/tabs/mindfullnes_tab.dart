import 'package:flutter/material.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';
import 'package:meditor/provider/custom_data-provider.dart';
import 'package:meditor/utils/colors.dart';
import 'package:meditor/utils/text_style.dart';
import 'package:provider/provider.dart';

class MindfilnessTab extends StatelessWidget {
  const MindfilnessTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Consumer<CustomDataPrvider>(
              builder: (BuildContext context,
                  CustomDataPrvider mindfullnessData, Widget? child) {
                final List<MindfullnessExercise> mindfulness =
                    mindfullnessData.getMindfulnessExercises();

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: mindfulness.length,
                  itemBuilder: (context, index) {
                    MindfullnessExercise mind = mindfulness[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.primaryDarkBlue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              mind.name,
                              style: AppTextStyles.subtitleStyle,
                            ),
                            IconButton(
                              onPressed: () {
                                mindfullnessData.deletMindfullness(
                                    mind, context);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: AppColors.primaryPurple,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          mind.description,
                          style: AppTextStyles.bodyStyle.copyWith(
                            color: AppColors.primaryDarkBlue.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
