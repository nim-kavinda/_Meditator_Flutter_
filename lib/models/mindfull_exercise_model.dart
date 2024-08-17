class MindfullnessExercise {
  final String category;
  final String name;
  final String discription;
  final List<String> instruction;
  final int duration;
  final String instructionUrl;
  final String imagePath;

  MindfullnessExercise({
    required this.category,
    required this.name,
    required this.discription,
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
      discription: json['description'],
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
      'description': discription,
      'instructions': instruction,
      'duration': duration,
      'instructions_url': instructionUrl,
      'image_path': imagePath,
    };
  }
}
