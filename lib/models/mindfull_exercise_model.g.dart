// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mindfull_exercise_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MindfullnessExerciseAdapter extends TypeAdapter<MindfullnessExercise> {
  @override
  final int typeId = 1;

  @override
  MindfullnessExercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MindfullnessExercise(
      category: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      instruction: (fields[3] as List).cast<String>(),
      duration: fields[4] as int,
      instructionUrl: fields[5] as String,
      imagePath: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MindfullnessExercise obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.instruction)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.instructionUrl)
      ..writeByte(6)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MindfullnessExerciseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
