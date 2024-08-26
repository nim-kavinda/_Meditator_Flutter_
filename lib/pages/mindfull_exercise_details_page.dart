import 'package:flutter/material.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';
import 'package:meditor/utils/colors.dart';
import 'package:meditor/utils/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class MindfullExerciseDetailsPage extends StatelessWidget {
  final MindfullnessExercise mindfullnessExercise;
  const MindfullExerciseDetailsPage({
    super.key,
    required this.mindfullnessExercise,
  });

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "Coudn't launch $url ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MindFull Exercise Details",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mindfullnessExercise.name,
                  style: AppTextStyles.titleStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  mindfullnessExercise.category,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  mindfullnessExercise.description,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Instructions",
                ),
                const SizedBox(
                  height: 20,
                ),
                ...mindfullnessExercise.instruction.map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 8,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(child: Text(e))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: AppColors.primaryGrey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("${mindfullnessExercise.duration} min")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _launchUrl(mindfullnessExercise.instructionUrl);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(AppColors.primaryGreen),
                  ),
                  child: Text(
                    "View Details Instruction",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
