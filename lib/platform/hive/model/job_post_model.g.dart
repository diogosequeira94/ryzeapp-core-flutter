// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobPostModelAdapter extends TypeAdapter<JobPostModel> {
  @override
  final int typeId = 0;

  @override
  JobPostModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobPostModel()
      ..id = fields[0] as String
      ..title = fields[1] as String
      ..posterName = fields[2] as String
      ..description = fields[3] as String
      ..location = fields[4] as String
      ..payRate = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, JobPostModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterName)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.payRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobPostModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
