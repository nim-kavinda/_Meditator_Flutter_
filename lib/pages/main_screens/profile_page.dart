import 'package:flutter/material.dart';
import 'package:meditor/models/meditation_exercise_model.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';
import 'package:meditor/models/sleep_exercise_model.dart';
import 'package:meditor/provider/custom_data-provider.dart';
import 'package:meditor/utils/colors.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profiles",
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Here are your custom exercises',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              const SizedBox(height: 15),
              Consumer<CustomDataPrvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildSectionTitle('Meditations'),
                      _buildMeditationList(value.getMediatation()),
                      const SizedBox(height: 20),
                      _buildSectionTitle('Mindfulness Exercises'),
                      _buildMindfulnessExerciseList(
                          value.getMindfulnessExercises()),
                      const SizedBox(height: 20),
                      _buildSectionTitle('Sleep Content'),
                      _buildSleepContentList(value.getSleepExercise()),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildContent({
    required title,
    required description,
    required duration,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          '${duration}min',
          style: const TextStyle(
            color: AppColors.primaryPurple,
          ),
        ),
      ),
    );
  }

  Widget _buildMeditationList(
    List<MeditationExercise> data,
  ) {
    if (data.isEmpty) {
      return const Text('No meditations created.');
    }
    return Column(
      children: data.map((meditation) {
        return _buildContent(
          title: meditation.name,
          description: meditation.description,
          duration: meditation.duration,
        );
      }).toList(),
    );
  }

  Widget _buildMindfulnessExerciseList(
    List<MindfullnessExercise> data,
  ) {
    if (data.isEmpty) {
      return const Text('No Mindfull Exerices created.');
    }
    return Column(
      children: data.map((meditation) {
        return _buildContent(
          title: meditation.name,
          description: meditation.description,
          duration: meditation.duration,
        );
      }).toList(),
    );
  }

  Widget _buildSleepContentList(
    List<SleepExercise> data,
  ) {
    if (data.isEmpty) {
      return const Text('No Sleep Exerices created.');
    }
    return Column(
      children: data.map((meditation) {
        return _buildContent(
          title: meditation.name,
          description: meditation.description,
          duration: meditation.duration,
        );
      }).toList(),
    );
  }
}
