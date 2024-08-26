import 'package:flutter/material.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';

class MindfullExerciseProvider extends ChangeNotifier {
  List<MindfullnessExercise> _allMindfullExercises = [];
  List<MindfullnessExercise> mindfullExercises = [];

  MindfullExerciseProvider() {
    _allMindfullExercises = [
      MindfullnessExercise(
        category: "Beginners",
        name: "Mindful Breathing",
        description:
            "This mindfulness exercise is perfect for beginners. It focuses on the simple act of breathing to help you become more aware of the present moment. By paying attention to each inhale and exhale, you can learn to anchor yourself in the here and now, reducing feelings of stress and anxiety.",
        instruction: [
          "Find a comfortable seat.",
          "Close your eyes and take a deep breath in.",
          "Exhale slowly, focusing on your breath.",
          "Repeat for the duration of the exercise."
        ],
        duration: 5,
        instructionUrl:
            "https://github.com/nim-kavinda/_Meditator_Flutter_.git",
        imagePath: "assets/images/mindfull.png",
      ),
      MindfullnessExercise(
        category: "Daily Practice",
        name: "Gratitude Journal",
        description:
            "This mindfulness exercise involves keeping a gratitude journal. By regularly writing down things you are grateful for, you can cultivate a positive mindset and improve your overall well-being. Reflect on positive experiences and record them in your journal to develop a greater sense of appreciation.",
        instruction: [
          "Find a quiet place to sit with your journal.",
          "Think of three things you are grateful for today.",
          "Write them down in your journal.",
          "Reflect on why these things are meaningful to you."
        ],
        imagePath: "assets/images/mindfull.png",
        duration: 10,
        instructionUrl:
            "https://github.com/nim-kavinda/_Meditator_Flutter_.git",
      ),
      MindfullnessExercise(
        category: "Stress Relief",
        name: "Body Scan",
        imagePath: "assets/images/mindfull.png",
        description:
            "This exercise helps to reduce stress by promoting awareness of physical sensations. It involves mentally scanning your body from head to toe, noticing any areas of tension and consciously relaxing them.",
        instruction: [
          "Lie down in a comfortable position.",
          "Close your eyes and take a few deep breaths.",
          "Focus on your toes, noticing any sensations.",
          "Slowly move your attention up through your body, relaxing each part as you go."
        ],
        duration: 15,
        instructionUrl:
            "https://github.com/nim-kavinda/_Meditator_Flutter_.git",
      ),
      MindfullnessExercise(
        category: "Focus",
        name: "Single-Tasking",
        imagePath: "assets/images/mindfull.png",
        description:
            "Improve your focus by practicing single-tasking. This exercise encourages you to give your full attention to one task at a time, reducing the habit of multitasking.",
        instruction: [
          "Choose a task to focus on (e.g., washing dishes).",
          "Set a timer for 10 minutes.",
          "Perform the task slowly and mindfully, paying attention to each step.",
          "If your mind wanders, gently bring it back to the task at hand."
        ],
        duration: 10,
        instructionUrl:
            "https://github.com/nim-kavinda/_Meditator_Flutter_.git",
      ),
      MindfullnessExercise(
        category: "Anxiety Relief",
        imagePath: "assets/images/mindfull.png",
        name: "Grounding Exercise",
        description:
            "This exercise helps to alleviate anxiety by grounding you in the present moment. It involves using your senses to connect with your surroundings.",
        instruction: [
          "Find a comfortable position to sit.",
          "Identify five things you can see.",
          "Identify four things you can touch.",
          "Identify three things you can hear.",
          "Identify two things you can smell.",
          "Identify one thing you can taste."
        ],
        duration: 10,
        instructionUrl:
            "https://github.com/nim-kavinda/_Meditator_Flutter_.git",
      ),
      MindfullnessExercise(
        category: "Mindfulness",
        name: "Mindful Walking",
        imagePath: "assets/images/mindfull.png",
        description:
            "This exercise involves walking slowly and mindfully, paying attention to the sensation of your feet touching the ground and the movement of your body.",
        instruction: [
          "Find a quiet place to walk.",
          "Walk slowly, paying attention to each step.",
          "Notice the sensations in your feet and legs.",
          "Focus on your breath and the rhythm of your movement."
        ],
        duration: 15,
        instructionUrl:
            "https://github.com/nim-kavinda/_Meditator_Flutter_.git",
      ),
      MindfullnessExercise(
        category: "Self-Acceptance",
        imagePath: "assets/images/mindfull.png",
        name: "Loving-Kindness Meditation",
        description:
            "Cultivate self-acceptance and compassion through loving-kindness meditation. This exercise involves silently repeating phrases of goodwill towards yourself and others.",
        instruction: [
          "Find a comfortable seat and close your eyes.",
          "Take a few deep breaths to settle in.",
          "Silently repeat the following phrases: 'May I be happy. May I be healthy. May I be safe. May I live with ease.'",
          "Extend these phrases to others: 'May you be happy. May you be healthy. May you be safe. May you live with ease.'"
        ],
        duration: 10,
        instructionUrl:
            "https://github.com/nim-kavinda/_Meditator_Flutter_.git",
      ),
      MindfullnessExercise(
        category: "Relaxation",
        name: "Progressive Muscle Relaxation",
        imagePath: "assets/images/mindfull.png",
        description:
            "This exercise helps to reduce physical tension and promote relaxation by progressively tensing and relaxing different muscle groups.",
        instruction: [
          "Find a comfortable position to sit or lie down.",
          "Close your eyes and take a few deep breaths.",
          "Start with your feet, tense the muscles for a few seconds, then release.",
          "Move up through your body, tensing and relaxing each muscle group."
        ],
        duration: 15,
        instructionUrl:
            "https://github.com/nim-kavinda/_Meditator_Flutter_.git",
      ),
      MindfullnessExercise(
        category: "Energy",
        name: "Morning Stretch",
        imagePath: "assets/images/mindfull.png",
        description:
            "Start your day with a mindful morning stretch. This exercise helps to wake up your body and mind, preparing you for the day ahead.",
        instruction: [
          "Stand up in a comfortable position.",
          "Take a deep breath and raise your arms above your head.",
          "Stretch your body gently from side to side.",
          "Hold each stretch for a few breaths, focusing on the sensations in your body."
        ],
        duration: 5,
        instructionUrl:
            "https://github.com/nim-kavinda/_Meditator_Flutter_.git",
      ),
      MindfullnessExercise(
        category: "Creativity",
        imagePath: "assets/images/mindfull.png",
        name: "Mindful Drawing",
        description:
            "Enhance your creativity through mindful drawing. This exercise involves focusing on the process of drawing without judgment or expectations.",
        instruction: [
          "Find a quiet place and gather your drawing materials.",
          "Set a timer for 10 minutes.",
          "Begin drawing whatever comes to mind, focusing on the movement of your hand and the feel of the pencil or brush on the paper.",
          "If your mind wanders, gently bring your attention back to the drawing."
        ],
        duration: 10,
        instructionUrl:
            "https://github.com/nim-kavinda/_Meditator_Flutter_.git",
      ),
    ];

    mindfullExercises = List.from(_allMindfullExercises);
  }

  //
  List<MindfullnessExercise> getAllMindfullExercises() {
    return mindfullExercises;
  }

  void searchMindfullExersice(String query) {
    if (query.isEmpty) {
      mindfullExercises = List.from(_allMindfullExercises);
    } else {
      mindfullExercises = _allMindfullExercises
          .where((exerise) =>
              exerise.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
