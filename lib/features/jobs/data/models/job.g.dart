// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobAdapter extends TypeAdapter<Job> {
  @override
  final int typeId = 4;

  @override
  Job read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Job(
      jobLocation: fields[5] as JobLocation,
      companyName: fields[1] as String,
      jobType: fields[4] as JobType,
      jobTitle: fields[0] as String,
      benefits: fields[13] as String,
      companyWebsiteLink: fields[8] as String,
      contactLocation: fields[3] as String,
      contactNumber: fields[2] as int,
      description: fields[11] as String,
      jobLink: fields[10] as String,
      linkedinProfile: fields[9] as String,
      resume: fields[7] as String,
      role: fields[12] as String,
      salary: fields[6] as Salary,
      skillsAndRequirements: fields[14] as String,
      id: fields[15] as String,
      isApplied: fields[16] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Job obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.jobTitle)
      ..writeByte(1)
      ..write(obj.companyName)
      ..writeByte(2)
      ..write(obj.contactNumber)
      ..writeByte(3)
      ..write(obj.contactLocation)
      ..writeByte(4)
      ..write(obj.jobType)
      ..writeByte(5)
      ..write(obj.jobLocation)
      ..writeByte(6)
      ..write(obj.salary)
      ..writeByte(7)
      ..write(obj.resume)
      ..writeByte(8)
      ..write(obj.companyWebsiteLink)
      ..writeByte(9)
      ..write(obj.linkedinProfile)
      ..writeByte(10)
      ..write(obj.jobLink)
      ..writeByte(11)
      ..write(obj.description)
      ..writeByte(12)
      ..write(obj.role)
      ..writeByte(13)
      ..write(obj.benefits)
      ..writeByte(14)
      ..write(obj.skillsAndRequirements)
      ..writeByte(15)
      ..write(obj.id)
      ..writeByte(16)
      ..write(obj.isApplied);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SalaryAdapter extends TypeAdapter<Salary> {
  @override
  final int typeId = 3;

  @override
  Salary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Salary(
      currency: fields[1] as Currency,
      amount: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Salary obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.currency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
