import 'package:hive/hive.dart';
part 'mindfull_exercise_model.g.dart';

@HiveType(typeId: 1)
class MindfullnessExercise {
  @HiveField(0)
  final String category;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final List<String> instruction;

  @HiveField(4)
  final int duration;

  @HiveField(5)
  final String instructionUrl;

  @HiveField(6)
  final String imagePath;

  MindfullnessExercise({
    required this.category,
    required this.name,
    required this.description,
    required this.instruction,
    required this.duration,
    required this.instructionUrl,
    required this.imagePath,
  });

  //method to convert the json data in to a MindfullnessExercise objrct
  factory MindfullnessExercise.fromJson(Map<String, dynamic> json) {
    return MindfullnessExercise(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      instruction: List<String>.from(json['instructions']),
      duration: json['duration'],
      instructionUrl: json['instructions_url'],
      imagePath: json['image_path'],
    );

    //json['category'] මගින් JSON සිතියමෙන් "category" යතුරට අදාළ අගය ලබා ගනී. මෙම අගය         MindfullnessExercise වස්තුවේ category ක්ෂේත්‍රයට පවරනු ලැබේ.
  }

  //convert MindfullnessExercise to json data
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'instructions': instruction,
      'duration': duration,
      'instructions_url': instructionUrl,
      'image_path': imagePath,
    };
  }
}
