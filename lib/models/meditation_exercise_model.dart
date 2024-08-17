class MeditationExercise {
  final String category;
  final String name;
  final String description;
  final int duration;
  final String audioUrl;
  final String videoUrl;

  MeditationExercise({
    required this.category,
    required this.name,
    required this.description,
    required this.duration,
    required this.audioUrl,
    required this.videoUrl,
  });

  // This method is used to convert the JSON data from the API into a Dart object.

  factory MeditationExercise.fromJson(Map<String, dynamic> json) {
    return MeditationExercise(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      audioUrl: json['audio_url'],
      videoUrl: json['video_url'],
    );
  }

  // This method is used to convert the Dart object into a JSON object that can be sent to the API.

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'duration': duration,
      'audio_url': audioUrl,
      'video_url': videoUrl,
    };
  }
}
