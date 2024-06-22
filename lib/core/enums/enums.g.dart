// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobTypeAdapter extends TypeAdapter<JobType> {
  @override
  final int typeId = 0;

  @override
  JobType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return JobType.fullTime;
      case 1:
        return JobType.partTime;
      default:
        return JobType.fullTime;
    }
  }

  @override
  void write(BinaryWriter writer, JobType obj) {
    switch (obj) {
      case JobType.fullTime:
        writer.writeByte(0);
        break;
      case JobType.partTime:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class JobLocationAdapter extends TypeAdapter<JobLocation> {
  @override
  final int typeId = 1;

  @override
  JobLocation read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return JobLocation.onsite;
      case 1:
        return JobLocation.remote;
      default:
        return JobLocation.onsite;
    }
  }

  @override
  void write(BinaryWriter writer, JobLocation obj) {
    switch (obj) {
      case JobLocation.onsite:
        writer.writeByte(0);
        break;
      case JobLocation.remote:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrencyAdapter extends TypeAdapter<Currency> {
  @override
  final int typeId = 2;

  @override
  Currency read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Currency.inr;
      case 1:
        return Currency.usd;
      case 2:
        return Currency.eur;
      case 3:
        return Currency.cad;
      default:
        return Currency.inr;
    }
  }

  @override
  void write(BinaryWriter writer, Currency obj) {
    switch (obj) {
      case Currency.inr:
        writer.writeByte(0);
        break;
      case Currency.usd:
        writer.writeByte(1);
        break;
      case Currency.eur:
        writer.writeByte(2);
        break;
      case Currency.cad:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
